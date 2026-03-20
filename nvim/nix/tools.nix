{lib, ...}: let
  recursiveMerge = attrList:
    with lib; let
      f = attrPath:
        zipAttrsWith (
          n: values:
            if tail values == []
            then head values
            else if all isList values
            # then unique (concatLists values)
            then (concatLists values) # INFO: Let them be merged by the build system
            else if all isAttrs values
            then f (attrPath ++ [n]) values
            else last values
        );
    in
      f [] attrList;
in {
  inherit recursiveMerge;
}
