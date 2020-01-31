Table 18100607 "CFG Lookup Table Configurator"//18100607
{
    Caption = 'Lookup Table Configurator';
    DrillDownPageID = "CFG Lookup Table Configurator";
    LookupPageID = "CFG Lookup Table Configurator";

    fields
    {
        field(1; "Table No."; Integer)
        {
            Caption = 'Table No.';
            TableRelation = AllObjWithCaption."Object ID";
        }
        field(2; "Table Name"; Code[50])
        {
            CalcFormula = lookup (AllObjWithCaption."Object Name" where("Object ID" = field("Table No.")));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Field No."; Integer)
        {
            Caption = 'Field No.';
            Editable = false;

            trigger OnLookup()
            begin
            end;
        }
        field(4; "Field Name"; Code[50])
        {
            CalcFormula = lookup (Field.FieldName where("No." = field("Field No."),
                                                        TableNo = field("Table No.")));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Table Relation No."; Integer)
        {
            Caption = 'Table Relation No.';

            trigger OnLookup()
            begin
            end;
        }
        field(6; "Table Relation Name"; Code[50])
        {
            CalcFormula = lookup (AllObjWithCaption."Object Name" where("Object ID" = field("Table Relation No.")));
            Caption = 'Table Relation Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Field Relation No."; Integer)
        {
            Caption = 'Field Relation No.';

            trigger OnLookup()
            begin
            end;
        }
        field(8; "Field Relation Name"; Code[50])
        {
            Caption = 'Field Relation Name';
            Editable = false;
        }
        field(9; Condition; Boolean)
        {
            CalcFormula = exist ("CFG Conf. Condition Specif." where("Table No." = field("Table No."),
                                                                     "Field No." = field("Field No."),
                                                                     "Filter Field No." = filter(<> 0),
                                                                     "Entry No." = field("Entry No.")));
            Caption = 'Condition';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }

        field(11; "Attribute"; Boolean)
        {
            Caption = 'Attribute';
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

    trigger OnInsert()
    var
        CFGItemConfiguratorCode: Record "CFG Item Configurator Code";
    begin
        CFGItemConfiguratorCode.SetRange("Table No.", "Table No.");
        CFGItemConfiguratorCode.SetRange("Field No.", "Field No.");
        CFGItemConfiguratorCode.SetRange("Entry No.", "Entry No.");
        CFGItemConfiguratorCode.FindFirst();

        CFGItemConfiguratorCode.TestField("Field Type", CFGItemConfiguratorCode."Field Type"::Field);
    end;

    var
        rcFields: Record "Field";
        pgFields: Page "CFG Field Virtual Table";
        rcObject: Record AllObjWithCaption;
        pgObject: Page "CFG Object";
}

