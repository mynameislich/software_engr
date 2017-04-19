/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LICH
 */
public class PathNode {

    String m_first;
    List<String> m_second = new ArrayList();
    boolean visited = false;

    public PathNode(String first, String second) {
        m_first = first;
        if (!m_second.contains(second)) {
            m_second.add(second);
        }
    }
    public PathNode(String first, List<String> second) {
        m_first = first;
        m_second = second;
    }
    public void visit() {
        visited = true;
    }

    public List<PathNode> filter(List<PathNode> inputList, String lastPlace) {
        List result = new ArrayList();
        for (Object each : inputList) {
            PathNode temp = (PathNode) each;
            if (temp.m_first == lastPlace && !temp.visited) {
                result.add(temp);
            }
        }
        return result;
    }
}
