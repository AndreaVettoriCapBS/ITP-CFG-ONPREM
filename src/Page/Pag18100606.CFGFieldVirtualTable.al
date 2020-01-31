Page 18100606 "CFG Field Virtual Table"//18100606
{
    PageType = ListPlus;
    SourceTable = "Field";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableNo; TableNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Table No.';
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                }
                field(TableName; TableName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Table Name';
                }
                field(FieldName; FieldName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Field Name';
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                }
                field(Len; Len)
                {
                    ApplicationArea = Basic;
                    Caption = 'Len';
                }
                field(Class; Class)
                {
                    ApplicationArea = Basic;
                    Caption = 'Class';
                }
                field(Enabled; Enabled)
                {
                    ApplicationArea = Basic;
                    Caption = 'Enabled';
                }
                field("Type Name"; "Type Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type Name';
                }
                field("Field Caption"; "Field Caption")
                {
                    ApplicationArea = Basic;
                    Caption = '<Field Caption>';
                }
                field(RelationTableNo; RelationTableNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relation Table No.';
                }
                field(RelationFieldNo; RelationFieldNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relation Field No.';
                }
            }
        }
    }

    actions
    {
    }
}

