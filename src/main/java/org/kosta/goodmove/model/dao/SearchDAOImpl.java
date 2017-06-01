package org.kosta.goodmove.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.goodmove.model.vo.CommentVO;
import org.kosta.goodmove.model.vo.PagingBean;
import org.kosta.goodmove.model.vo.SearchVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO {
	
	@Resource
	 private SqlSessionTemplate template;

	@Override
	public List<CommentVO> searchComment(SearchVO svo, PagingBean pagingBean) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("scategory", svo.getScategory());
		map.put("word", svo.getWord());
		map.put("startRowNumber", pagingBean.getStartRowNumber());
		map.put("endRowNumber", pagingBean.getEndRowNumber());
		return template.selectList("comment.search", map);
	}

	@Override 
	public int countday() {
		String today = template.selectOne("member.today");
		int findtoday = template.selectOne("member.findtoday", today);
		if(findtoday==0){
			template.insert("member.insertday", today);
			template.update("member.upcount", today);
		}else{
			template.update("member.upcount", today);
		}
		return template.selectOne("member.getcount", today);
	}

	
}
