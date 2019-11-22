package com.xtkj.pro.controller;

import com.xtkj.pro.common.JsonResult;
import com.xtkj.pro.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/pro")
public class ProductController {
    @Autowired
    private IProductService proService;
    @RequestMapping("/list")
    public JsonResult listPro(@RequestParam(defaultValue = "0") int offset,
                              @RequestParam(defaultValue = "5") int limit,String name) {
        JsonResult result=null;
        System.out.println(offset+":"+limit+":"+name);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("name",name);
        try {
            result = new JsonResult("200","success", proService.listPro(params));
        } catch (Exception e) {
            e.printStackTrace();
            result = new JsonResult("500", e.getMessage());
        }
        return result;
    }

}
