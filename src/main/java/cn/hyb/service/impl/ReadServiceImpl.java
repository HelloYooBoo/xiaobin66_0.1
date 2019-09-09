package cn.hyb.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hyb.mapper.XbArticleAgreeMapper;
import cn.hyb.mapper.XbArticleCollectMapper;
import cn.hyb.mapper.XbArticleLastAltertimeMapper;
import cn.hyb.mapper.XbArticleMapper;
import cn.hyb.mapper.XbArticleVisitMapper;
import cn.hyb.mapper.XbCommentAgreeMapper;
import cn.hyb.mapper.XbCommentMapper;
import cn.hyb.mapper.XbUserInfoMapper;
import cn.hyb.mapper.XbUserMapper;
import cn.hyb.netpojo.ArticleCard;
import cn.hyb.pojo.XbArticle;
import cn.hyb.pojo.XbArticleAgree;
import cn.hyb.pojo.XbArticleAgreeExample;
import cn.hyb.pojo.XbArticleCollect;
import cn.hyb.pojo.XbArticleCollectExample;
import cn.hyb.pojo.XbArticleExample;
import cn.hyb.pojo.XbArticleLastAltertime;
import cn.hyb.pojo.XbArticleLastAltertimeExample;
import cn.hyb.pojo.XbArticleVisit;
import cn.hyb.pojo.XbArticleVisitExample;
import cn.hyb.pojo.XbCommentAgree;
import cn.hyb.pojo.XbCommentAgreeExample;
import cn.hyb.pojo.XbCommentExample;
import cn.hyb.service.ReadService;

@Service
public class ReadServiceImpl implements ReadService {
	@Resource
	private XbUserMapper xbUserMapper;
	@Resource
	private XbArticleMapper xbArticleMapper;
	@Resource
	private XbUserInfoMapper xbUserInfoMapper;
	@Resource
	private XbArticleAgreeMapper xbArticleAgreeMapper;
	@Resource
	private XbArticleCollectMapper xbArticleCollectMapper;
	@Resource
	private XbArticleLastAltertimeMapper xbArticleLastAltertimeMapper;
	@Resource
	private XbArticleVisitMapper xbArticleVisitMapper;
	@Resource
	private XbCommentMapper xbCommentMapper;
	@Resource
	private XbCommentAgreeMapper xbCommentAgreeMapper;
	
	@Override
	public ArticleCard selOneById(int articleId) {
		
		XbArticle xbArticle = xbArticleMapper.selectByPrimaryKey(articleId);
		ArticleCard articleCard = null;
		if(xbArticle==null||xbArticle.getEx()==0) {
			return null;
		}
		
		try {
			articleCard = new ArticleCard();
			articleCard.setId(xbArticle.getId());
			articleCard.setTitle(xbArticle.getTitle());
			articleCard.setUploadtime(xbArticle.getUploadtime());
			articleCard.setAuthorName(xbUserInfoMapper.selectByPrimaryKey(xbArticle.getAuthorId()).getNickname());
			articleCard.setOpenwords(xbArticle.getOpenwords());
			articleCard.setArticlebody(xbArticle.getArticlebody());
			articleCard.setEx(1);
			articleCard.setTextorwallpaper(0);
			//获取点赞数
			XbArticleAgreeExample agreeExample = new XbArticleAgreeExample();
			agreeExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
			articleCard.setAgreeNumber(xbArticleAgreeMapper.countByExample(agreeExample));

			//获取收藏数
			XbArticleCollectExample collectExample = new XbArticleCollectExample();
			collectExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
			articleCard.setCollectNumber(xbArticleCollectMapper.countByExample(collectExample));

			//文章浏览数
			XbArticleVisitExample articleVisitExample = new XbArticleVisitExample();
			articleVisitExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
			articleCard.setVisitNumber(xbArticleVisitMapper.countByExample(articleVisitExample));

			//文章评论数
			XbCommentExample commentExample = new XbCommentExample();
			commentExample.createCriteria().andArticleIdEqualTo(xbArticle.getId()).andExEqualTo(1);
			articleCard.setCommentNumber(xbCommentMapper.countByExample(commentExample));

			//最后编辑时间
			XbArticleLastAltertimeExample altertimeExample=new XbArticleLastAltertimeExample();
			altertimeExample.createCriteria().andArticleIdEqualTo(xbArticle.getId());
			List<XbArticleLastAltertime> lastTimeList = xbArticleLastAltertimeMapper.selectByExample(altertimeExample);
			if(lastTimeList.size()>0) {
				articleCard.setLastAlterTime(lastTimeList.get(lastTimeList.size()-1).getLastAltertime());
			}
			
		} catch (Exception e) {
			System.out.println("拼装失败！！");
			// TODO: handle exception
		}
		return articleCard;
	}

	@Override
	public List<XbArticle> selNewest() {
		XbArticleExample articleExample =new XbArticleExample();
//		{
//			System.out.println("测试用：\n");
//			articleExample.setOrderByClause("id ASC");//ASC 和 DESC
//			articleExample.setOffset(0);
//			articleExample.setLimit(6);
//			List<XbArticle> alist = xbArticleMapper.selectByExample(articleExample);
//			System.out.println(alist);
//		}
		articleExample.setOrderByClause("id DESC");//ASC 和 DESC降序
		articleExample.setOffset(0);
		articleExample.setLimit(6);
		articleExample.createCriteria().andExEqualTo(1);
		List<XbArticle> alist = xbArticleMapper.selectByExample(articleExample);
		return alist;
	}

	@Override
	public List<XbArticle> selHotest() {
		
		//文章总数
		int articleNum=xbArticleMapper.countByExample(null);
		//先查出所有浏览记录
		Map<Integer, Integer> agreeMap=new HashMap<Integer, Integer>();
		for(int i=1;i<=articleNum;i++) {
			XbArticleVisitExample articleVisitExample = new XbArticleVisitExample();
			articleVisitExample.createCriteria().andArticleIdEqualTo(i);
			int agreenum = xbArticleVisitMapper.countByExample(articleVisitExample);
			//统计每个articleId出现的次数
			agreeMap.put(i, agreenum);
		}
		
		//选出次数最多的6六条记录
		List<Map.Entry<Integer, Integer>> entries = new ArrayList<Map.Entry<Integer, Integer>>(agreeMap.entrySet());
        Collections.sort(entries, new Comparator<Map.Entry<Integer, Integer>>() {
            public int compare(Map.Entry<Integer, Integer> obj1, Map.Entry<Integer, Integer> obj2) {
                return obj2.getValue().compareTo(obj1.getValue()) ;
            }
        });
        List<XbArticle> sortList=new ArrayList<XbArticle>();
        int count=0;
        for (Entry<Integer, Integer> entry : entries) {
        	//按照id查出XbArticle
    		//按照降序插入list
        	sortList.add(xbArticleMapper.selectByPrimaryKey(entry.getKey()));
        	if(count++==5) {
        		break;
        	}
		}
		return sortList;
	}

	@Override
	public int updVisit(int articleId, int visiterId) {
		XbArticleVisit xbArticlVisit =new XbArticleVisit();
		xbArticlVisit.setArticleId(articleId);
		xbArticlVisit.setUserId(visiterId);
		int index = xbArticleVisitMapper.insertSelective(xbArticlVisit);
		return index;
	}

	@Override
	public int updAgreeForArticle(int articleId, int visiterId) {
		XbArticleAgreeExample example = new XbArticleAgreeExample();
		example.createCriteria().andArticleIdEqualTo(articleId).andUserIdEqualTo(visiterId);
		List<XbArticleAgree> isEx = xbArticleAgreeMapper.selectByExample(example);
		if(isEx==null||isEx.size()==0) {
			//没点过赞，增加记录
			System.out.println("没点过赞，增加记录");
			XbArticleAgree agree = new XbArticleAgree();
			agree.setArticleId(articleId);
			agree.setUserId(visiterId);
			int index = xbArticleAgreeMapper.insertSelective(agree);
			return index;
		}else {
			return 0;
		}
	}

	@Override
	public int updCollect(int articleId, int visiterId) {
		//先验证是否存在
		XbArticleCollectExample example = new XbArticleCollectExample();
		example.createCriteria().andArticleIdEqualTo(articleId).andUserIdEqualTo(visiterId);
		List<XbArticleCollect> isEx = xbArticleCollectMapper.selectByExample(example);
		if(isEx==null||isEx.size()==0) {//不存在
			XbArticleCollect collect=new XbArticleCollect();
			collect.setArticleId(articleId);
			collect.setUserId(visiterId);
			int index = xbArticleCollectMapper.insertSelective(collect);
			return index;
		}else {//收藏过了(存在)
			int index = xbArticleCollectMapper.deleteByPrimaryKey(isEx.get(0).getId());
			return index>0?2:0;
		}
	}

	@Override
	public int updAgreeForComment(int commentId, int visiterId) {
		XbCommentAgreeExample example = new XbCommentAgreeExample();
		example.createCriteria().andCommentIdEqualTo(commentId).andUserIdEqualTo(visiterId);
		List<XbCommentAgree> isEx = xbCommentAgreeMapper.selectByExample(example);
		if(isEx==null||isEx.size()==0) {
			//没点过赞，增加记录
			System.out.println("没点过赞，增加记录");
			XbCommentAgree agree = new XbCommentAgree();
			agree.setCommentId(commentId);
			agree.setUserId(visiterId);
			int index = xbCommentAgreeMapper.insertSelective(agree);
			return index;
		}else {
			return 0;
		}
	}

	@Override
	public int selIsCollect(int articleId, int visiterId) {
		XbArticleCollectExample example = new XbArticleCollectExample();
		example.createCriteria().andArticleIdEqualTo(articleId).andUserIdEqualTo(visiterId);
		List<XbArticleCollect> selectByExample = xbArticleCollectMapper.selectByExample(example);
		return selectByExample.size();
	}

	@Override
	public List<Integer> selIsAgreeForComment(int visiterId) {
		XbCommentAgreeExample example = new XbCommentAgreeExample();
		example.createCriteria().andUserIdEqualTo(visiterId);
		List<XbCommentAgree> selectByExample = xbCommentAgreeMapper.selectByExample(example);
		List<Integer> ans = new ArrayList<Integer>();
		for (XbCommentAgree xbCommentAgree : selectByExample) {
			ans.add(xbCommentAgree.getCommentId());
		}
		return ans;
	}

	@Override
	public List<Integer> selIsAgreeForArticle(Integer articleId,int visiterId) {
		
		XbArticleAgreeExample example = new XbArticleAgreeExample();
		if(articleId!=null) {
			example.createCriteria().andUserIdEqualTo(visiterId).andArticleIdEqualTo(articleId);
		}else {
			example.createCriteria().andUserIdEqualTo(visiterId);
		}
		List<XbArticleAgree> selectByExample = xbArticleAgreeMapper.selectByExample(example);
		List<Integer> ans = new ArrayList<Integer>();
		for (XbArticleAgree xbArticleAgree : selectByExample) {
			ans.add(xbArticleAgree.getArticleId());
		}
		return ans;
	}
	
}








