Page 18100609 "CFG Object"//18100609
{
    PageType = List;
    SourceTable = AllObjWithCaption;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type"; "Object Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Object Type';
                }
                field("Object ID"; "Object ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Object ID';
                }
                field("Object Name"; "Object Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Object Name';
                }
            }
        }
    }

    actions
    {
    }
}

