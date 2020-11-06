package com.fh.service.impl;

import com.fh.dao.OrderMapper;
import com.fh.entity.OrderInfo;
import com.fh.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    public List<OrderInfo> queryOrder(int start, int pageSize) {
        return orderMapper.queryOrder(start,pageSize);
    }

    public List<OrderInfo> queryOrder1(String num, BigDecimal money) {
        return orderMapper.queryOrder1(num,money);
    }

    public List<OrderInfo> queryOrder2(String num, BigDecimal money) {
        return orderMapper.queryOrder2(num,money);
    }

    public void deleteOrder(List<Integer> ids) {
        orderMapper.deleteOrder(ids);
    }

    public void updateOrder(OrderInfo orderInfo) {
        orderMapper.updateOrder(orderInfo);
    }
}
