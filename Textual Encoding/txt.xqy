xquery version "3.0";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare option saxon:output "method=text";

(: Very simple transformation from HTML to text :)

for $p in //p
return ("&#10;", fn:normalize-space(fn:string-join($p, "")))