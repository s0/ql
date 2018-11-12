/**
 * @name AV Rule 53.1
 * @description The following character sequences shall not appear in header file names: ', \, /*, //, or ".
 * @kind problem
 * @id cpp/jsf/av-rule-53-1
 * @problem.severity warning
 * @tags maintainability
 *       portability
 */
import cpp

from Include i, string name
where name = i.getIncludeText()
      and (name.matches("%'%") or
           name.matches("%\\\\%") or
           name.matches("%/*%") or
           name.matches("%//%") or
           name.matches("%\"%\"%\"%") or
           name.matches("%<%\"%>%"))
select i, "AV Rule 53.1: Invalid character sequence in header file name '" + name + "'"
