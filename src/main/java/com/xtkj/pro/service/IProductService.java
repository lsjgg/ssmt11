package com.xtkj.pro.service;

import com.github.pagehelper.PageInfo;
import com.xtkj.pro.entity.Product;

import java.util.Map;

public interface IProductService {
    public PageInfo<Product> listPro(Map<String, Object> params);
}
