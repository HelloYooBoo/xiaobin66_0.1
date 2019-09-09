package cn.hyb.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.pojo.XbUser;
import cn.hyb.pojo.XbUserExample;
import cn.hyb.pojo.XbUserInfo;
import cn.hyb.service.RegService;

@Service
public class RegServiceImpl implements RegService{

	@Resource
	private XbUserMapper xbUserMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	
	@Override
	public int regUser(XbUser user) {
		int userCheckNum = UserCheck(user.getUsername());
		if(userCheckNum>0) {
			//用户名重复,拒绝插入
			return 0;
		}else {
			//用户名不重复，开始插入新用户
			if(user.getPassword()==null||user.getUsername()==null) {
				//无效的空数据
				return 0;
			}else {
				try {
					int index=xbUserMapper.insertSelective(user);
					XbUserExample userExample=new XbUserExample();
					userExample.createCriteria().andPasswordEqualTo(user.getPassword()).andUsernameEqualTo(user.getUsername());
					int newid = xbUserMapper.selectByExample(userExample).get(0).getId();
					XbUserInfo userInfo = new XbUserInfo();
					userInfo.setId(newid);
					userInfo.setRegdate(new Date());
					userInfo.setNickname(user.getUsername());
					int index2 = xbUserInfoMapper.insertSelective(userInfo);
					return index*index2;
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("注册时发生了错误");
				}
				return 0;
			}
		}
	}
	@Override
	public int UserCheck(String username) {
		XbUserExample xbUserExample=new XbUserExample();
		xbUserExample.createCriteria().andUsernameEqualTo(username);
		//根据注册用户查询是否重复
		int num = xbUserMapper.countByExample(xbUserExample);
		System.out.println(num);
		return num;
	}

}
