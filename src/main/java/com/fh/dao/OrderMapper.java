package com.fh.dao;

import com.fh.entity.OrderInfo;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface OrderMapper {
    List<OrderInfo> queryOrder();

    List<OrderInfo> queryOrder1(@Param("num")String num,@Param("money")BigDecimal money);

    List<OrderInfo> queryOrder2(@Param("num")String num,@Param("money")BigDecimal money);

    void deleteOrder(@Param("ids") List<Integer> ids);

    void updateOrder(@Param("order") OrderInfo orderInfo);
}
