package com.ezwel.core.support.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * JSON관련 가공에 필요한 함수들
 * @auther ddakker 2013. 12. 12.
 */
public class JsonUtils2 {

    private static final Log log = LogFactory.getLog(JsonUtils.class);
    private static ObjectMapper mapper = new ObjectMapper();
    private static com.fasterxml.jackson.databind.ObjectMapper mapperSecond = new com.fasterxml.jackson.databind.ObjectMapper();

    public static <T> T toJson(String jsonStr, Class<T> clz) {
    	try {
			return mapper.readValue(jsonStr, clz);
		} catch (IOException e) {
			log.warn("org.codehaus.jackson.map.ObjectMapper - convertor fail");
			try {
				return mapperSecond.readValue(jsonStr, clz);
			} catch (IOException ee) {
				log.warn("com.fasterxml.jackson.databind.ObjectMapper - convertor fail");
				return null;
			}
		}
    }
    
    /**
     * Object JSON String 로 변환
     * @param obj
     * @return
     * @auther ddakker 2016. 3. 4.
     */
    public static String toString(Object obj) {
    	try {
			return mapper.writeValueAsString(obj);
		} catch (IOException e) {
			log.warn("org.codehaus.jackson.map.ObjectMapper - convertor fail");
			try {
				return mapperSecond.writeValueAsString(obj);
			} catch (IOException ee) {
				log.warn("com.fasterxml.jackson.databind.ObjectMapper - convertor fail");
				return null;
			}
		}
    }

    /**
     * 2차원 배열의 부모/자식 관계의 데이터를 트리형식으로 재나열 한다.
     * @param list          2차원 배열
     * @param rootId        최상위 id[무모자식관계가 없을경우 null]
     * @param idKey         유니크한 키(id가 될 필드명)
     * @param pIdKey        부모키(pId가 될 필드명)[무모자식관계가 없을경우 null]
     * @param titleKey      메뉴명이 표시될 필드명
     * @return
     * @auther ddakker 2013. 12. 12.
     */
    public static List<Map<String, Object>> convertorTreeMap(final List<Map<String, Object>> list, String rootId,
    		final String idKey, final String pIdKey, final String titleKey) {
        return convertorTreeMap(list, rootId, idKey, pIdKey, titleKey, null);
    }

    /**
     * 2차원 배열의 부모/자식 관계의 데이터를 트리형식으로 재나열 한다.
     * @param list          2차원 배열
     * @param rootId        최상위 id[무모자식관계가 없을경우 null]
     * @param idKey         유니크한 키(id가 될 필드명)
     * @param pIdKey        부모키(pId가 될 필드명)[무모자식관계가 없을경우 null]
     * @param titleKey      메뉴명이 표시될 필드명
     * @param orderKey      정렬이 필요한경우 정령 필드명
     * @return
     * @auther ddakker 2013. 12. 12.
     */
    public static List<Map<String, Object>> convertorTreeMap(List inList, String rootId, final String idKey, final String pIdKey,
    		final String titleKey, final String orderKey) {
        List<Map<String, Object>> treeList = new ArrayList<Map<String,Object>>();   // 최종 트리

		if (inList == null || inList.size() == 0)
			throw new RuntimeException("List<Map> 데이터가 없습니다.");

		if (inList.get(0) == null)
			throw new RuntimeException("Map 데이터가 없습니다.");

        final List<Map<String, Object>> list = new ArrayList<Map<String,Object>>(); // 원본데이터(Bean일경우 Map으로 변환)
        Iterator iter;
		for (iter = inList.iterator(); iter.hasNext();) {
			try {
                Object obj = iter.next();
				if (obj instanceof Map) {
                    list.add((Map<String, Object>) obj);
				} else {
                    list.add((Map<String, Object>) PropertyUtils.describe(obj));
                }
			} catch (Exception e) {
                throw new RuntimeException("Collection -> List<Map> 으로 변환 중 실패: " + e);
            }
        }

        int listLength = list.size();
        int loopLength = 0;
		final int[] treeLength = new int[] { 0 };

		if (pIdKey == null) {
			for (Map<String, Object> item : list) {
				Map<String, Object> view = new HashMap<String, Object>(item);
        		view.put("title", item.get(titleKey));
				view.put("children", new ArrayList<Map<String, Object>>());
                treeList.add(view);
        	}
		} else {
			while (treeLength[0] != listLength && listLength != loopLength++) {
				for (int i = 0; i < list.size(); i++) {
					Map<String, Object> item = list.get(i);

					if (rootId.equals(String.valueOf(item.get(pIdKey)))) {
						Map<String, Object> view = new HashMap<String, Object>(item);
	                    view.put("title", item.get(titleKey));
	                    view.put("children", new ArrayList<Map<String,Object>>());

	                    treeList.add(view);
	                    list.remove(i);
	                    treeLength[0]++;

						if (orderKey != null) {
							Collections.sort(treeList, new Comparator<Map<String, Object>>() {
								public int compare(Map<String, Object> arg0, Map<String, Object> arg1) {
									return (String.valueOf(arg0.get(orderKey))).compareTo(String.valueOf(arg1.get(orderKey)));
	                            }
	                        });
	                    }
	                    break;

					} else {
						new InnerClass() {
	                        public void getParentNode(List<Map<String, Object>> children, Map<String, Object> item ) {
								for (int i = 0; i < children.size(); i++) {
									Map<String, Object> child = children.get(i);
									if (child.get(idKey).equals(item.get(pIdKey))) {
										Map<String, Object> view = new HashMap<String, Object>(item);
	                                    view.put("title", item.get(titleKey));
	                                    view.put("children", new ArrayList<Map<String,Object>>());

	                                    ((List<Map<String,Object>>) child.get("children")).add(view);
	                                    treeLength[0]++;
	                                    list.remove(list.indexOf(item));

										if (orderKey != null) {
	                                        Collections.sort(((List<Map<String,Object>>) child.get("children")), new Comparator<Map<String, Object>>() {
	                                            public int compare(Map<String, Object> arg0, Map<String, Object> arg1) {
	                                            	return (String.valueOf(arg0.get(orderKey))).compareTo(String.valueOf(arg1.get(orderKey)));
	                                            }
	                                        });
	                                    }
	                                    break;
									} else {
										if (((List<Map<String, Object>>) child.get("children")).size() > 0) {
	                                        getParentNode((List<Map<String,Object>>) child.get("children"), item);
	                                    }
	                                }
	                            }
	                        }
	                    }.getParentNode(treeList, item);
	                }
	            }
	        }
        }
        return treeList;
    }

    public interface InnerClass {
        public void getParentNode(List<Map<String, Object>> list, Map<String, Object> item );
    }

}