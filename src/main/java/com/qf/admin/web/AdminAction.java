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
    @RequestMapping("/adminlogin")
    public String login() {

        return "adminlogin";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){

        session.removeAttribute("user");
        return "redirect:/adminlogin";
    }

    //验证【管理员】登陆的账号密码
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

    //验证【用户】登陆的账号密码
    @RequestMapping("/userLogin")
    @ResponseBody
    public String userLogin(@RequestBody User u, HttpSession session) {

        User person = adminService.searchUser(u);

        if(person != null){
            session.setAttribute("person",person);
            session.setMaxInactiveInterval(15*60);
            //判断应聘者的应聘公司，并跳到对应的填写界面
            if("浙农控股集团有限公司".equals(person.getYpgs())){
                return "addPersonInfo_znkg";
            }
            if("浙江农资集团投资发展有限公司".equals(person.getYpgs())){
                return "addPersonInfo";
            }
            return "addPersonInfo";
        }
        return "error";
    }

    //根据路径返回jsp页面
    @RequestMapping("/{path}")
    public String index1(@PathVariable String path,HttpSession session) {

        if(adminService.searchPath(path) != null){
            return "userlogin";
        }else if(path.equals("addPersonInfo_znkg")){
            //在应聘者登陆的情况下，防止他跳到别的登记页面去
            User person = (User) session.getAttribute("person");
            if(person!=null){
                if("浙农控股集团有限公司".equals(person.getYpgs())){
                    return path;
                }
            }
            return "userlogin";
        }else if(path.equals("addPersonInfo")){

            User person = (User) session.getAttribute("person");

            if(person!=null){
                if("浙江农资集团投资发展有限公司".equals(person.getYpgs())){
                    return path;
                }
            }
            return "userlogin";
        }else if(path.equals("addPerson")){
            //增加应聘人员页面判断管理员是否登陆
            Admin admin = (Admin) session.getAttribute("user");
            if(admin == null){
                return "adminlogin";
            }
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

        //判断是否有提交码
        int sum = adminService.searchCode(personInfo.getCode());

        if(sum < 1){
            //如果没有提交码
            return "codeMiss";
        }else{
            //记录可提交次数
            int num = adminService.searchNum(personInfo.getCode());
            if(num<1){
                return "useOff";
            }
        }

        String strSfzh = adminService.searchSfzh(personInfo.getXm(),personInfo.getSj());

        //存在身份证号说明已经填过了
        if(strSfzh != null && strSfzh.equals(personInfo.getSfzh())){

            adminService.savePersonInfo(personInfo);
            adminService.updateNum(personInfo.getCode());
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

        List<PersonInfo> pi = adminService.searchSfzh(sfzh);

        //第一次填但是已经重复
        if((strSfzh == null || "".equals(strSfzh)) && !pi.isEmpty()){
            return "error";
        }
        //非第一次填，跟原来一样
        if(sfzh.equals(strSfzh)){
            return "ok";
        }
        //非第一次填，跟原来不一样，跟其他重复
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
