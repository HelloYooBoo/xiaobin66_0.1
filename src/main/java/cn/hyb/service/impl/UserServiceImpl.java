package cn.hyb.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbUserMapper;
import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserExample;
import cn.hyb.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private XbUserMapper xbUserMapper;
	
	@Override
	public int selUserRole(XbUser user) {
		if(user==null) {
			System.out.println("user 为空");
			return 0;
		}
		if(user.getId()==null) {
			System.out.println("user 属性为空"+user.getUsername());
			return 0;
		}
		XbUser selUser = xbUserMapper.selectByPrimaryKey(user.getId());

		if(selUser!=null&&selUser.getUsername().equals(user.getUsername())&&selUser.getPassword().equals(user.getPassword())) {
			System.out.println("user 存在");
			//开始业务处理
			return selUser.getRoleId();
			
		}
		
		return 0;
	}

}
