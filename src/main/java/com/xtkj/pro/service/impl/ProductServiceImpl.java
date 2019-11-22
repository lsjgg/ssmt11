package com.xtkj.pro.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xtkj.pro.dao.ProductMapper;
import com.xtkj.pro.entity.Product;
import com.xtkj.pro.entity.ProductExample;
import com.xtkj.pro.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductMapper proDao;

    @Override
    public PageInfo<Product> listPro(Map<String, Object> params) {
        PageHelper.offsetPage(Integer.valueOf(params.get("offset").toString()), Integer.valueOf(params.get("limit").toString()));
        ProductExample example = new ProductExample();
        if (params.get("name") != null && params.get("name") != "") {
            example.createCriteria().andPnameLike("%"+(String) params.get("name")+"%");
        }
        List<Product> pros = proDao.selectByExample(example);
        PageInfo<Product> pageInfo = new PageInfo<Product>(pros);
        return pageInfo;
    }
}
