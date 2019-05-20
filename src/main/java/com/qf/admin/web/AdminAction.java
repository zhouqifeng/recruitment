package com.qf.admin.web;

import com.qf.admin.pojo.dto.PageInfo;
import com.qf.admin.pojo.dto.Result;
import com.qf.admin.pojo.po.*;
import com.qf.admin.pojo.vo.Search;
import com.qf.admin.pojo.vo.Security;
import com.qf.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class AdminAction {

    @Autowired
    private AdminService adminService;

    //登陆，不单独写出来的话会一直重定向
    @RequestMapping("/login")
    public String login() {

        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){

        session.removeAttribute("user");
        return "redirect:/login";
    }

    @RequestMapping("/adminLogin")
    @ResponseBody
    public String login(@RequestBody Admin admin, HttpSession session) {

        Admin user = adminService.searchAdmin(admin);

        if(user != null){
            session.setAttribute("user",user);
            session.setMaxInactiveInterval(15*60);
            return "ok";
        }
        return "error";
    }

    @RequestMapping("/userLogin")
    @ResponseBody
    public String userLogin(@RequestBody User u, HttpSession session) {

        User person = adminService.searchUser(u);

        if(person != null){
            session.setAttribute("person",person);
            session.setMaxInactiveInterval(15*60);
            return "ok";
        }
        return "error";
    }

    //根据路径返回jsp页面
    @RequestMapping("/{path}")
    public String index1(@PathVariable String path,HttpSession session) {

        if(adminService.searchPath(path) != null){
            return "userlogin";
        }else if(path.equals("addPersonInfo")){

            User person = (User) session.getAttribute("person");
            if(person!=null){
                return path;
            }
            return "userlogin";
        }else if(path.equals("addPerson")){

            return "addPerson";
        }

        return path;
    }

    @RequestMapping("/index")
    public String index(HttpSession session) {

        Admin user = (Admin) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        return "index";
    }

    @RequestMapping("/password")
    public String password(HttpSession session) {

        Admin user = (Admin) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        return "password";
    }

    @RequestMapping("/security")
    public String security(HttpSession session, Model model) {

        Admin user = (Admin) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        Security security = adminService.searchSecurity(user);
        model.addAttribute("security",security);

        return "security";
    }

    @RequestMapping("/findlist")
    public String findlist(HttpSession session) {

        Admin user = (Admin) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        return "findlist";
    }

    @RequestMapping("/find")
    @ResponseBody
    public Result<PersonInfo> find(PageInfo pageInfo, Search search) {

        return adminService.find(pageInfo,search);
    }

    @RequestMapping("/deletePersonInfo")
    @ResponseBody
    public int deletePersonInfo(@RequestParam("sj") String sj) {

        return adminService.deletePersonInfo(sj);
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public String updatePassword(@RequestParam("oldpassword") String oldpassword,@RequestParam("newpassword") String newpassword, HttpSession session) {

        Admin user = (Admin) session.getAttribute("user");
        if(user.getPassword().equals(oldpassword)){
            adminService.updatePassword(user.getUsername(),newpassword);
            user.setPassword(newpassword);
            session.setAttribute("user",user);
            return "ok";
        }
        return "error";
    }

    @PostMapping("/updateSecurity")
    @ResponseBody
    public String updateSecurity(@RequestBody Security security, HttpSession session) {

        Admin user = (Admin) session.getAttribute("user");
        adminService.updateSecurity(security,user);

        return "ok";
    }

    //添加个人信息功能
    @PostMapping("/addPersonInfo")
    @ResponseBody
    public String addPersonInfo(@RequestBody PersonInfo personInfo){

        int sum = adminService.searchCode(personInfo.getCode());

        if(sum < 1){
            return "codeMiss";
        }else{
            int num = adminService.searchNum(personInfo.getCode());
            if(num<1){
                return "useOff";
            }
        }

        String strSfzh = adminService.searchSfzh(personInfo.getXm(),personInfo.getSj());

        if(strSfzh != null && strSfzh.equals(personInfo.getSfzh())){

            adminService.savePersonInfo(personInfo);
            return "modify";
        }

        adminService.savePersonInfo(personInfo);
        adminService.updateNum(personInfo.getCode());
        return "ok";

    }

    @PostMapping(value = "/searchSfzh")
    @ResponseBody
    public String searchSfzh(@RequestParam("sfzh") String sfzh, HttpSession session){

        User person = (User)session.getAttribute("person");

        String strSfzh = adminService.searchSfzh(person.getXm(),person.getSj());

        if(strSfzh == null || strSfzh.equals(sfzh)){
            return "ok";
        }

        List<PersonInfo> pi = adminService.searchSfzh(sfzh);

        if(!pi.isEmpty()){
            return "error";
        }

        return "ok";

    }

    @PostMapping(value = "/searchCode")
    @ResponseBody
    public String searchCode(@RequestParam("code") String code, HttpSession session){

        int sum = adminService.searchCode(code,(Admin)session.getAttribute("user"));

        if(sum < 1){
            return "ok";
        }

        return "error";

    }

    @GetMapping(value = "/editPersonInfo")
    public String editPersonInfo(@RequestParam("sj") String sj,@RequestParam("xm") String xm, HttpSession session){

        Admin user = (Admin) session.getAttribute("user");

        if(user == null){
            return "redirect:/login";
        }

        User u = new User();
        u.setSj(sj);
        u.setXm(xm);

        User person = adminService.searchUser(u);
        session.setAttribute("person",person);
        session.setMaxInactiveInterval(15*60);

        return "editPersonInfo";

    }

    @PostMapping(value = "/editPerson")
    @ResponseBody
    public String editPerson(@RequestBody User u, HttpSession session){

        User person = (User)session.getAttribute("person");

        List<PersonInfo> pi = adminService.searchSj(u.getSj());

        if(!pi.isEmpty() && !u.getSj().equals(person.getSj())){

            return "error";
        }

        adminService.editPerson(person,u);
        return "ok";
    }

    @PostMapping(value = "/addPerson")
    @ResponseBody
    public String addPerson(@RequestBody User u){

        List<PersonInfo> pi = adminService.searchSj(u.getSj());

        if(!pi.isEmpty()){

            return "error";
        }

        adminService.addPerson(u);
        return "ok";
    }

}
