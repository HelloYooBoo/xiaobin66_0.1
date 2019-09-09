package cn.hyb.service;

import cn.hyb.netpojo.RoomBean;
import cn.hyb.netpojo.User;

public interface RoomBeanService {
	/**
	 * 根据User信息装配出room信息
	 * @param user
	 * @return
	 */
	RoomBean assembleRoomBean(User user);
}
