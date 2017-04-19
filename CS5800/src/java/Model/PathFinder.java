/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;
import Model.PathNode;
import dao.FlightDataAccess;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LICH
 */
public class PathFinder {
// import time type then do time operation properly
    ArrayList<PathNode> m_allPath = new ArrayList();

    public PathFinder(String time) {
        ArrayList<PathNode> allPath = new ArrayList();
        FlightDataAccess da = new FlightDataAccess();
        List airports = da.getAll();
        for (Object each : airports) {
            Flight temp = (Flight) each;
            if (temp.getTime().equals(time)) {
                allPath.add(new PathNode(temp.origin, temp.destination));
            }else{
                System.out.println(temp.getTime());
            }
        }
        Map<String, List<String>> formatting = new HashMap();
        for (Object each : allPath) {
            PathNode temp = (PathNode) each;
            if (!formatting.containsKey(temp.m_first)) {
                formatting.put(temp.m_first, temp.m_second);
            } else {
                List<String> AddingList = temp.m_second;
                List<String> OriginalList = formatting.get(temp.m_first);
                for (String itr : AddingList) {
                    if (!OriginalList.contains(itr)) {
                        OriginalList.add(itr);
                    }
                }
                formatting.put(temp.m_first, OriginalList);
            }
        }
        for (String itr : formatting.keySet()) {
            m_allPath.add(new PathNode(itr, formatting.get(itr)));
        }
    }

    public List<PathNode> getList() {
        return this.m_allPath;
    }

    public List Caculator2way(String from, String to, String departTime, String returnTime) {
        List result;
        result = Caculator1way(from, to, departTime);
        // List temp =Caculator1way(to, from, returnTime);
        result.addAll(Caculator1way(to, from, returnTime));
        return result;
    }

    public List Caculator1way(String from, String to, String departTime) {
        List result = new ArrayList();
        PathFinder PF = new PathFinder(departTime);
        List<PathNode> list = PF.getList();

        for (int i = 0; i < PF.m_allPath.size(); i++) {
            if (list.get(i).m_first.equals(from)) {
                result = PF.Finding((ArrayList) list, list.get(i), to);
            }
        }
        return result;
    }

    public List<PathNode> Finding(ArrayList<PathNode> thePathes, PathNode thisOne, String target) {
        List result = new ArrayList();
        System.out.println(thisOne.m_first);
        if (thisOne.visited) {
            return result;
        } else if (thisOne.m_second.contains(target)) {
            result.add(thisOne);
            return result;
        } else {
            for (Object each : thePathes) {
                PathNode temp = (PathNode) each;
                if (temp.m_first == thisOne.m_first) {
                    temp.visit();
                }
                each = temp;
                for (Object itr : thisOne.m_second) {
                    List<PathNode> got = new ArrayList();
                    for (Object itr2 : thePathes) {
                        PathNode it = (PathNode) itr2;
                        if (it.m_first.equals(itr)) {
                            got = Finding(thePathes, it, target);
                        }
                    }

                    if (!got.isEmpty()) {
                        for (int i = 0; i < got.size(); i++) {
                            result.add(got.get(i));
                        }
                    }
                }
            }

        }
        return result;
    }

    public static void main(String[] args) {
        PathFinder PF = new PathFinder("2");
        List<PathNode> list = PF.getList();
        List<PathNode> result = new ArrayList();
        for (int i = 0; i < PF.m_allPath.size(); i++) {
            if (list.get(i).m_first.equals("GGWP")) {
                result = PF.Finding((ArrayList) list, list.get(i), "BA");
            }
        }
        for(int i = 0; i<result.size();i++){
            System.out.println(i);
            System.out.println(result.get(i).m_first);
        }
    }
}
