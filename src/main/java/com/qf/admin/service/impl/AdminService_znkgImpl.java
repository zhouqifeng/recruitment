package com.qf.admin.service.impl;

import com.qf.admin.mapper.AdminMapper;
import com.qf.admin.mapper.AdminMapper_znkg;
import com.qf.admin.pojo.po.PersonInfo;
import com.qf.admin.service.AdminService_znkg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService_znkgImpl implements AdminService_znkg {

    //要使用接口，不需要使用具体实现（log4j logback）
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AdminMapper_znkg mapper_znkg;

    @Override
    public void savePersonInfo_znkg(PersonInfo personInfo) {
        mapper_znkg.updatePersonInfo_znkg(personInfo);
    }

}
