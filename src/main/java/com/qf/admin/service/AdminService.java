package com.qf.admin.service;

import com.qf.admin.pojo.dto.PageInfo;
import com.qf.admin.pojo.dto.Result;
import com.qf.admin.pojo.po.*;
import com.qf.admin.pojo.vo.Search;
import com.qf.admin.pojo.vo.Security;

import java.util.List;

public interface AdminService {

    void savePersonInfo(PersonInfo personInfo);

    List<PersonInfo> searchSfzh(String sfzh);

    String searchSfzh(String xm,String sj);

    List<PersonInfo> searchSj(String sj);

    Admin searchAdmin(Admin admin);

    int updatePassword(String username,String newpassword);

    Security searchSecurity(Admin user);

    int updateSecurity(Security security, Admin user);

    Result<PersonInfo> find(PageInfo pageInfo, Search search);

    String searchPath(String path);

    int searchCode(String code);

    int searchCode(String code,Admin admin);

    void updateNum(String code);

    int searchNum(String code);

    int deletePersonInfo(String sj);

    User searchUser(User u);

    void editPerson(User person, User u);

    void addPerson(User u);
}
