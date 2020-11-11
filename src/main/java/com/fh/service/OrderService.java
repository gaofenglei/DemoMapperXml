package com.fh.service;

import com.fh.entity.OrderInfo;

import java.math.BigDecimal;
import java.util.List;

public interface OrderService {
    List<OrderInfo> queryOrder();

    List<OrderInfo> queryOrder1(String num, BigDecimal money);

    List<OrderInfo> queryOrder2(String num, BigDecimal money);

    void deleteOrder(List<Integer> ids);

    void updateOrder(OrderInfo orderInfo);
}
