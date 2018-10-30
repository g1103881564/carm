package com.orilore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IRecordBiz;
import com.orilore.model.Detail;
import com.orilore.model.Record;

@Controller
@RequestMapping("/pages/record/")
public class CtrRecord {
	@Resource
	private IRecordBiz biz;
	
	/**
	 * �������������ѯ�����Ϣ
	 * @param bean
	 * @return List<Record>
	 */
	@RequestMapping("query")
	public @ResponseBody List<Record> query(@RequestBody Record bean){
		return biz.findRecord(bean);
	}
	
	/**
	 * �����·ݲ�ѯ����֧�����
	 * @param m����
	 * @return List<Record>
	 */
	@RequestMapping("month/{m}")
	public @ResponseBody List<Record> stateMonth(@PathVariable("m") String m){
		String month = m+"-01";
		return biz.monthState(month);
	}
	
	/**
	 * ������ݲ�ѯ����֧�����
	 * @param y���
	 * @return List<Record>
	 */
	@RequestMapping("year/{y}")
	public @ResponseBody List<Record> stateYear(@PathVariable("y") String y){
		return biz.yearState(y);
	}
	
	/**
	 * �������������ѯҳ��
	 * @param bean
	 * @return int
	 */
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Record bean){
		return biz.getPages(bean);
	}
	
	/**
	 * ����IDɾ��ά�޼�¼
	 * @param id
	 * @return boolean
	 */
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeRecord(id);
	}
	
	/**
	 * ����ID��ѯά�޼�¼
	 * @param id
	 * @return Record
	 */
	@RequestMapping("get/{id}")
	public @ResponseBody Record getRecord(@PathVariable("id") int id){
		return biz.getRecord(id);
	}
	
	/**
	 * ����ά�޼�¼
	 * @param request
	 * @return boolean
	 */
	@RequestMapping("save")
	public @ResponseBody boolean save(HttpServletRequest request){
		//��ȡ�������-ά������
		String date = request.getParameter("date");
		//��ȡ�������-ά��Ա��ID
		String emp = request.getParameter("emp");
		//��ȡ�������-֧����ʽ
		String pay = request.getParameter("pay");
		//��ȡ�������-��ʱ��
		String hmoney = request.getParameter("hmoney");
		//��ȡ�������-ʵ�ս��
		String smoney = request.getParameter("smoney");
		//��ȡ�������-Ӧ�ս��
		String ymoney = request.getParameter("ymoney");
		//��ȡ�������-��ע
		String info = request.getParameter("info");
		//��ȡ�������-����ID
		String carid = request.getParameter("carid");
		//��ȡ�������-���ID����
		String[] cids = request.getParameterValues("cids[]");
		//��ȡ�������-����ͺ�����
		String[] sizes = request.getParameterValues("sizes[]");
		//��ȡ�������-�������¼ID����
		String[] sids = request.getParameterValues("sids[]");
		//��ȡ�������-�����������
		String[] prices = request.getParameterValues("prices[]");
		//��ȡ�������-����ۼ�����
		String[] sales = request.getParameterValues("sales[]");
		//��ȡ�������-���ʹ����������
		String[] quantitys = request.getParameterValues("quantitys[]");
		/*********����ά�޼�¼����record��װ����***********/
		Record record = new Record();
		record.setCid(Integer.parseInt(carid));
		record.setYmoney(Float.parseFloat(ymoney));
		record.setSmoney(Float.parseFloat(smoney));
		record.setHmoney(Float.parseFloat(hmoney));
		record.setMdate(date);
		record.setInfo(info);
		record.setEmp(Integer.parseInt(emp));
		record.setPay(pay);
		record.setStatus(0);
		/**************ά�޼�¼��װ���******************/
		
		/***********�������ʹ����ϸ����ds****************/
		List<Detail> ds = null;
		if(cids!=null){
			ds = new ArrayList<Detail>();
			for(int i=0;i<cids.length;i++){
				Detail d = new Detail();
				d.setCid(Integer.parseInt(cids[i]));
				d.setSize(sizes[i]);
				d.setSid(Integer.parseInt(sids[i]));
				d.setPrice(Float.parseFloat(prices[i]));
				d.setSale(Float.parseFloat(sales[i]));
				d.setQuantity(Float.parseFloat(quantitys[i]));
				ds.add(d);
			}
		}
		/***********���ʹ����ϸ����ds��װ���***********************/
		return biz.addRecords(record,ds);
	}
}
