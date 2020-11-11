package com.fh.controller;

import com.fh.entity.OrderInfo;
import com.fh.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("queryOrder")
    @ResponseBody
    public String queryOrder(@RequestParam(value = "start",defaultValue = "0") int start,@RequestParam(value = "pageSize",defaultValue = "3") int pageSize){
        //利用PageHelper分页查询 注意：这个一定要放查询语句的前一行,否则无法进行分页,因为它对紧随其后第一个sql语句有效
        PageHelper.startPage(start, pageSize);
        List<OrderInfo> orderInfos=orderService.queryOrder();
        PageInfo<OrderInfo> pageInfo = new PageInfo<OrderInfo>(orderInfos);

        return "总:  "+pageInfo.getTotal()+"当前:  "+pageInfo.getPageSize()+"每页:  "+pageInfo.getSize();
    }


    @RequestMapping("queryOrder1")
    @ResponseBody
    public List<OrderInfo> queryOrder1(String num, BigDecimal money){
        return orderService.queryOrder1(num,money);
    }

    @RequestMapping("queryOrder2")
    @ResponseBody
    public List<OrderInfo> queryOrder2(String num, BigDecimal money){
        return orderService.queryOrder2(num,money);
    }

    @RequestMapping("deleteOrder")
    public String deleteOrder(){

        List<Integer> ids=new ArrayList<Integer>();
        for (int i = 0; i <= 3; i++) {
            ids.add(i);
        }

        if(ids.size()>0){
            orderService.deleteOrder(ids);
            return "删除成功";
        }
        return "删除失败";
    }


    @RequestMapping("updateOrder")
    public void updateOrder(OrderInfo orderInfo){
        orderService.updateOrder(orderInfo);
    }

}
