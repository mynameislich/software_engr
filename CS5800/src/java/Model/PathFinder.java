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
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LICH
 */
public class PathFinder {
// import time type then do time operation properly

    ArrayList<PathNode> m_allPath = new ArrayList();
    ArrayList<PathNode> m_results = new ArrayList();

    public PathFinder(String time) throws ParseException {
        ArrayList<PathNode> allPath = new ArrayList();
        FlightDataAccess da = new FlightDataAccess();
        List airports = da.getAll();
        for (Object each : airports) {
            Flight temp = (Flight) each;
            if (temp.getDepartingTime().equals(time)) {
                allPath.add(new PathNode(temp.origin, temp.destination));
            } else {
                System.out.println(temp.getDepartingTime());
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

    public List Caculator2way(String from, String to, String departTime, String returnTime) throws ParseException {
        List result;
        result = Caculator1way(from, to, departTime);
        // List temp =Caculator1way(to, from, returnTime);
        result.addAll(Caculator1way(to, from, returnTime));
        return result;
    }

    public List Caculator1way(String from, String to, String departTime) throws ParseException {
        List result = new ArrayList();
        DateFormat format = null;
        PathFinder PF = new PathFinder(format.parse(departTime));
        List<PathNode> list = PF.getList();

        for (int i = 0; i < PF.m_allPath.size(); i++) {
            if (list.get(i).m_first.equals(from)) {
                HashMap input = new HashMap();
                result = PF.Finding((ArrayList) list, list.get(i), to, input);
            }
        }
        return result;
    }

    public List<PathNode> Finding(ArrayList<PathNode> thePathes, PathNode thisOne, String target, HashMap theVisited) {
        List result = new ArrayList();

        //System.out.println(thisOne.m_first);
        if (theVisited.containsKey(thisOne.m_first)) {
            return result;
        } else {
            theVisited.put(thisOne.m_first, 1);
            result.add(thisOne);
            for (Object each : thePathes) {
                PathNode temp = (PathNode) each;
                if (temp.m_first.equals(thisOne.m_first)) {
                    temp.visit();
                    each = temp;
                    for (Object itr : thisOne.m_second) {
                        List<PathNode> got;
                        for (Object itr2 : thePathes) {
                            PathNode it = (PathNode) itr2;
                            if (it.m_first.equals(itr)) {
                                got = Finding(thePathes, it, target, theVisited);
                                if (!got.isEmpty()) {
                                    for (int i = 0; i < got.size(); i++) {
                                        result.add(got.get(i));
                                    }
                                    result.add(thisOne);
                                }
                            }
                        }
                        if (itr.equals(target)) {
                            //theVisited.put(thisOne.m_first, 1);
                            //result.add(thisOne);

                            result.add(new PathNode(target, new ArrayList()));
                            //return result;
                        }

                    }
                }

            }

        }
        return result;
    }

    public static void main(String[] args) throws ParseException {
        PathFinder PF = new PathFinder(new Date());
        List<PathNode> list = PF.getList();
        List<PathNode> result = new ArrayList();
        HashMap input = new HashMap();
        for (int i = 0; i < PF.m_allPath.size(); i++) {
            if (list.get(i).m_first.equals("GGWP")) {
                result.addAll(PF.Finding((ArrayList) list, list.get(i), "BA", input));
            }
        }
        for (int i = 0; i < result.size(); i++) {
            System.out.println(i);
            System.out.println(result.get(i).m_first);
        }
    }
}
