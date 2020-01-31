Table 18100609 "CFG Conf. Condition Specif."//18100609
{
    Caption = 'Configurator Condition Specifications';

    fields
    {
        field(10; "Table No."; Integer)
        {
            Caption = 'Table No.';
            NotBlank = true;
            TableRelation = AllObjWithCaption."Object ID";
        }
        field(20; "Field No."; Integer)
        {
            Caption = 'Field No.';
            NotBlank = true;
        }
        field(30; "Entry No."; Integer)
        {
            Editable = false;
        }
        field(40; "Filter Field No."; Integer)
        {
            Caption = 'Filter Field No.';
            NotBlank = true;

            trigger OnLookup()
            begin
                Clear(PgFields);
                RcLookUpConfig.SetRange("Table No.", "Table No.");
                RcLookUpConfig.SetRange("Field No.", "Field No.");
                if RcLookUpConfig.FindSet then begin
                    RcFields.Reset;
                    RcFields.FilterGroup(2);
                    RcFields.SetRange(TableNo, "Table No.");
                    RcFields.SetFilter(RcFields.Type, '%1 | %2', RcFields.Type::Code, RcFields.Type::Text);
                    RcFields.FilterGroup(0);
                    PgFields.SetTableview(RcFields);
                    PgFields.SetRecord(RcFields);
                    PgFields.LookupMode(true);
                    if PgFields.RunModal = Action::LookupOK then begin
                        PgFields.GetRecord(RcFields);
                        "Filter Field No." := RcFields."No.";
                    end;
                end;
            end;
        }
        field(50; "Filter Type"; Option)
        {
            Caption = 'Filter Type';
            NotBlank = true;
            OptionCaption = 'CONST,FILTER';
            OptionMembers = "CONST","FILTER";
        }
        field(60; "Filter Value"; Text[250])
        {
            Caption = 'Filter Value';
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Table No.", "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RcFields: Record "Field";
        PgFields: Page "CFG Field Virtual Table";
        RcLookUpConfig: Record "CFG Lookup Table Configurator";
}

