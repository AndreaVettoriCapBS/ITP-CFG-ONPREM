Page 18100608 "CFG Table Relation Filters"//18100608
{
    Caption = 'Table Relation Filters';
    PageType = List;
    SourceTable = "CFG Table Relation Filters";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Filter Field No."; "Filter Field No.")
                {
                    ApplicationArea = Basic;
                }
                field("Filter Type"; "Filter Type")
                {
                    ApplicationArea = Basic;
                }
                field("Filter Value"; "Filter Value")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    procedure "TableNo&FieldNo"(PTableNo: Integer; PFieldNo: Integer; PEntryNo: Integer)
    begin
        FilterGroup(2);
        SetRange("Table No.", PTableNo);
        SetRange("Field No.", PFieldNo);
        SetRange("Entry No.", PEntryNo);
        FilterGroup(0);
        if IsEmpty then begin
            Init;
            "Table No." := PTableNo;
            "Field No." := PFieldNo;
            "Entry No." := PEntryNo;
            if not Insert then
                Modify;
        end;
    end;
}

