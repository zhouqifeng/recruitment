package com.qf.admin.web;

import com.qf.admin.pojo.po.PersonInfo;
import com.qf.admin.service.AdminService;
import com.qf.admin.service.AdminService_znkg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class AdminAction_znkg {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminService_znkg adminService_znkg;

    //添加个人信息功能
    @PostMapping("/addPersonInfo_znkg")
    @ResponseBody
    public String addPersonInfo_znkg(@RequestBody PersonInfo personInfo){

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

            adminService_znkg.savePersonInfo_znkg(personInfo);
            adminService.updateNum(personInfo.getCode());
            return "modify";
        }

        adminService_znkg.savePersonInfo_znkg(personInfo);
        adminService.updateNum(personInfo.getCode());
        return "ok";

    }

}
