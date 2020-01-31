Page 18100610 "CFG Condition Specification"//18100610
{
    Caption = 'Condition Specification';
    PageType = List;
    SourceTable = "CFG Conf. Condition Specif.";

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

    var
        EntryNo: Integer;

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

