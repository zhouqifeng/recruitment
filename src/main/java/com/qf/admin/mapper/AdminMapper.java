package com.qf.admin.mapper;

import com.qf.admin.pojo.dto.PageInfo;
import com.qf.admin.pojo.dto.Result;
import com.qf.admin.pojo.po.*;
import com.qf.admin.pojo.vo.Search;
import com.qf.admin.pojo.vo.Security;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {

    void addPersonInfo(@Param("personInfo") PersonInfo personInfo);

    void updatePersonInfo(@Param("personInfo") PersonInfo personInfo);

    List<PersonInfo> selectSfzh(@Param("sfzh") String sfzh);

    String selectSfzh2(@Param("xm") String xm, @Param("sj") String sj);

    List<PersonInfo> selectSj(@Param("sj") String sj);

    Admin selectAdmin(@Param("admin") Admin admin);

    int updatePassword(@Param("username") String username, @Param("newpassword") String newpassword);

    Security selectSecurity(@Param("admin") Admin admin);

    int updateSecurity(@Param("security") Security security, @Param("admin") Admin admin);

    List<PersonInfo> findPersonInfo(@Param("pageInfo") PageInfo pageInfo,@Param("search") Search search);

    long countPersonInfo(@Param("search") Search search);

    String selectPath(@Param("path") String path);

    int selectCode(@Param("code") String code);

    int selectCode2(@Param("code") String code, @Param("admin") Admin admin);

    void updateNum(@Param("code") String code);

    int searchNum(@Param("code") String code);

    int deletePersonInfo(@Param("sj") String sj);

    User selectUser(@Param("u") User u);

    void editPerson(@Param("person")User person,@Param("u") User u);

    void addPerson(@Param("u") User u);

}
