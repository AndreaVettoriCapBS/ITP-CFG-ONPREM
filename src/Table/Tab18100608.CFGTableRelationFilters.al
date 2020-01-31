Table 18100608 "CFG Table Relation Filters"//18100608
{

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID";
        }
        field(2; "Field No."; Integer)
        {
            Caption = 'Field No.';
        }
        field(3; "Filter Field No."; Integer)
        {
            Caption = 'Filter Field No.';
            NotBlank = true;

            trigger OnLookup()
            begin
                Clear(PgFields);
                RcLookupConfig.SetRange("Table No.", "Table No.");
                RcLookupConfig.SetRange("Field No.", "Field No.");
                if RcLookupConfig.FindSet then begin
                    RcFields.Reset;
                    RcFields.FilterGroup(2);
                    RcFields.SetRange(TableNo, RcLookupConfig."Table Relation No.");
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
        field(4; "Filter Type"; Option)
        {
            BlankZero = true;
            Caption = 'Filter Type';
            OptionCaption = 'CONST,FILTER,FIELD';
            OptionMembers = "CONST","FILTER","FIELD";
        }
        field(5; "Filter Value"; Text[250])
        {
            Caption = 'Filter Value';
            NotBlank = true;

            trigger OnLookup()
            begin
                if "Filter Type" = "filter type"::Field then begin
                    RcLookupConfig.SetRange("Table No.", "Table No.");
                    RcLookupConfig.SetRange("Field No.", "Field No.");
                    if RcLookupConfig.FindSet then begin
                        Clear(PgFields);
                        RcFields.Reset;
                        RcFields.FilterGroup(2);
                        RcFields.SetRange(TableNo, "Table No.");
                        RcFields.FilterGroup(0);
                        PgFields.SetTableview(RcFields);
                        PgFields.SetRecord(RcFields);
                        PgFields.LookupMode(true);
                        if PgFields.RunModal = Action::LookupOK then begin
                            PgFields.GetRecord(RcFields);
                            "Filter Value" := Format(RcFields."No.");
                        end;
                    end;
                end;
            end;
        }
        field(6; "Filter Value Field No."; Integer)
        {
            Caption = 'Filter Value Field No.';
            NotBlank = true;
        }
        field(7; "Entry No."; Integer)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Table No.", "Field No.", "Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RcFields: Record "Field";
        PgFields: Page "CFG Field Virtual Table";
        RcLookupConfig: Record "CFG Lookup Table Configurator";
}

