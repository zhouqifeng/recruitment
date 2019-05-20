package com.qf.admin.service.impl;

import com.qf.admin.mapper.AdminMapper;
import com.qf.admin.pojo.dto.PageInfo;
import com.qf.admin.pojo.dto.Result;
import com.qf.admin.pojo.po.*;
import com.qf.admin.pojo.vo.Search;
import com.qf.admin.pojo.vo.Security;
import com.qf.admin.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    //要使用接口，不需要使用具体实现（log4j logback）
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AdminMapper mapper;

    @Override
    public void savePersonInfo(PersonInfo personInfo) {
        mapper.updatePersonInfo(personInfo);
    }

    @Override
    public List<PersonInfo> searchSfzh(String sfzh) {
        return mapper.selectSfzh(sfzh);
    }

    @Override
    public String searchSfzh(String xm,String sj) {
        return mapper.selectSfzh2(xm,sj);
    }

    @Override
    public List<PersonInfo> searchSj(String sj) {
        return mapper.selectSj(sj);
    }

    @Override
    public Admin searchAdmin(Admin admin) {
        return mapper.selectAdmin(admin);
    }

    @Override
    public int updatePassword(String username,String newpassword) {
        return mapper.updatePassword(username,newpassword);
    }

    @Override
    public Security searchSecurity(Admin user) {
        return mapper.selectSecurity(user);
    }

    @Override
    public int updateSecurity(Security security, Admin user) {
        return mapper.updateSecurity(security,user);
    }

    @Override
    public Result<PersonInfo> find(PageInfo pageInfo, Search search) {

        Result result = new Result<PersonInfo>();

        result.setCode(0);
        result.setMsg("success");
        try {
            result.setCount(mapper.countPersonInfo(search));
            result.setData(mapper.findPersonInfo(pageInfo,search));
        } catch (Exception e) {
            //查询发生异常时的情况
            result.setCode(1);
            result.setMsg("failed");
            //查询发生异常时将进行日志输出(输出到控制台还是到日志文件,由logback.xml决定)
            logger.error(e.getMessage(), e);
        }


        return result;
    }

    @Override
    public String searchPath(String path) {
        return mapper.selectPath(path);
    }

    @Override
    public int searchCode(String code) {
        return mapper.selectCode(code);
    }

    @Override
    public int searchCode(String code,Admin admin) {
        return mapper.selectCode2(code,admin);
    }

    @Override
    public void updateNum(String code) {
        mapper.updateNum(code);
    }

    @Override
    public int searchNum(String code) {
        return mapper.searchNum(code);
    }

    @Override
    public int deletePersonInfo(String sj) {
        return mapper.deletePersonInfo(sj);
    }

    @Override
    public User searchUser(User u) {
        return mapper.selectUser(u);
    }

    @Override
    public void editPerson(User person, User u) {
        mapper.editPerson(person,u);
    }

    @Override
    public void addPerson(User u) {
        mapper.addPerson(u);
    }


}
