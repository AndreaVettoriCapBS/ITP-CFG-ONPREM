Table 18100605 "CFG Item Configurator Code"//18100605
{
    Caption = 'Item Configurator Code';

    fields
    {
        field(1; "Procurement System"; Option)
        {
            Caption = 'Procurement System';
            OptionCaption = 'Purchase,Prod. Order,Production BOM';
            OptionMembers = Purchase,"Prod. Order","Production BOM";
        }
        field(2; "Field Name"; Option)
        {
            Caption = 'Field Name';
            OptionCaption = 'No.,Description,Value';
            OptionMembers = "No.",Description,Value;
        }
        field(3; "Character No."; Integer)
        {
            Caption = 'Character No.';
        }
        field(4; "Field No."; Integer)
        {
            Caption = 'Field No.';
            Editable = true;
        }
        field(5; "Field"; Code[30])
        {
            Caption = 'Field';

            trigger OnValidate()
            var
                ItemAttributeTranslation: Record "Item Attribute Translation";
                Language: record language;
            begin
                case "Field Type" of
                    "field type"::Field:
                        begin
                            rcFields.Reset;
                            rcFields.SetRange(TableNo, Database::item);
                            rcFields.SetFilter(rcFields.Type, '%1 | %2', rcFields.Type::Code, rcFields.Type::Text);
                            rcFields.SetRange("Field Caption", "Field");
                            rcFields.SetRange(Class, rcFields.Class::Normal);
                            rcFields.FindFirst;

                            "Field No." := rcFields."No.";
                            "Table No. Relation" := rcFields.RelationTableNo;
                            "Field No. Relation" := rcFields.RelationFieldNo;
                        end;
                    "field type"::Attribute:
                        begin
                            Language.SETRANGE("Windows Language ID", GLOBALLANGUAGE);
                            IF Language.FINDFIRST THEN BEGIN
                                ItemAttributeTranslation.setrange("Language Code", Language.code);
                                ItemAttributeTranslation.setrange("Name", Field);
                                if ItemAttributeTranslation.FindFirst() then begin
                                    ItemAttribute.reset;
                                    ItemAttribute.SetRange(Type, ItemAttribute.Type::Option);
                                    ItemAttribute.setrange(ID, ItemAttributeTranslation."Attribute ID");
                                    if ItemAttribute.FindFirst() then begin
                                        "Field No." := ItemAttribute.ID;
                                        exit;
                                    end;
                                end;
                            end;

                            ItemAttribute.reset;
                            ItemAttribute.SetRange(Type, ItemAttribute.Type::Option);
                            ItemAttribute.setrange(Name, field);
                            if ItemAttribute.FindFirst() then
                                "Field No." := ItemAttribute.ID;
                        end;
                end;

                if "field type" = "field type"::Attribute then
                    exit;

                RcLookup.Reset;
                RcLookup.SetRange("Table No.", "Table No.");
                RcLookup.SetRange("Field No.", "Field No.");
                RcLookup.SetRange("Entry No.", "Entry No.");
                if not RcLookup.FindSet then begin
                    RcLookup.Init;
                    RcLookup."Table No." := "Table No.";
                    RcLookup."Field No." := "Field No.";
                    RcLookup."Entry No." := "Entry No.";
                    RcLookup.Attribute := "Field Type" = "Field Type"::Attribute;
                    RcLookup.Reset;

                    if ("Table No. Relation" <> 0) then
                        RcLookup."Table Relation No." := "Table No. Relation";
                    if ("Field No. Relation" <> 0) then
                        RcLookup."Field Relation No." := "Field No. Relation";
                    if not RcLookup.Insert then
                        RcLookup.Modify;
                end;
            end;

            trigger OnLookup()
            begin
                case "Field Type" of
                    "field type"::Field:
                        begin
                            Clear(pgFields);
                            rcFields.Reset;
                            rcFields.FilterGroup(2);
                            rcFields.SetRange(TableNo, Database::Item);
                            rcFields.SetFilter(rcFields.Type, '%1 | %2 | %3', rcFields.Type::Code, rcFields.Type::Text, rcFields.Type::Option);
                            rcFields.SetRange(Class, rcFields.Class::Normal);
                            rcFields.FilterGroup(0);
                            pgFields.SetTableview(rcFields);
                            pgFields.SetRecord(rcFields);
                            pgFields.LookupMode(true);
                            if pgFields.RunModal = Action::LookupOK then begin
                                pgFields.GetRecord(rcFields);
                                "Field No." := rcFields."No.";
                                Field := rcFields."Field Caption";
                                "Table No. Relation" := rcFields.RelationTableNo;
                                "Field No. Relation" := rcFields.RelationFieldNo;
                            end;
                        end;
                    "field type"::Attribute:
                        begin
                            Clear(ItemAttributes);
                            ItemAttribute.reset;
                            ItemAttribute.FilterGroup(2);
                            ItemAttribute.SetRange(Type, ItemAttribute.Type::Option);
                            ItemAttribute.FilterGroup(0);
                            ItemAttributes.SetTableView(ItemAttribute);
                            ItemAttributes.LookupMode(true);
                            if ItemAttributes.RunModal() = Action::LookupOK then begin
                                ItemAttributes.GetRecord(ItemAttribute);
                                "Field No." := ItemAttribute.ID;
                                Field := ItemAttribute.GetNameInCurrentLanguage();
                            end;
                        end;
                end;

                if "field type" = "field type"::Attribute then
                    exit;

                RcLookup.Reset;
                RcLookup.SetRange("Table No.", "Table No.");
                RcLookup.SetRange("Field No.", "Field No.");
                RcLookup.SetRange("Entry No.", "Entry No.");
                if not RcLookup.FindSet then begin
                    RcLookup.Init;
                    RcLookup."Table No." := "Table No.";
                    RcLookup."Field No." := "Field No.";
                    RcLookup."Entry No." := "Entry No.";
                    RcLookup.Attribute := "Field Type" = "Field Type"::Attribute;
                    RcLookup.Reset;

                    if ("Table No. Relation" <> 0) then
                        RcLookup."Table Relation No." := "Table No. Relation";
                    if ("Field No. Relation" <> 0) then
                        RcLookup."Field Relation No." := "Field No. Relation";
                    if not RcLookup.Insert then
                        RcLookup.Modify;
                end;
            end;
        }
        field(6; "Field Character No."; Integer)
        {
            Caption = 'Field Character No.';
        }
        field(7; "Table No. Relation"; Integer)
        {
            Caption = 'Table No. Relation';
            Editable = false;
        }
        field(8; "Field No. Relation"; Integer)
        {
            Caption = 'Field No. Relation';
            Editable = false;
        }
        field(9; "Table No."; Integer)
        {
            Caption = 'Table No.';
        }
        field(10; "Customed Relation"; Boolean)
        {
            CalcFormula = exist ("CFG Lookup Table Configurator" where("Table No." = field("Table No."),
                                                                   "Field No." = field("Field No."),
                                                                   "Entry No." = field("Entry No.")));
            Caption = 'Customed Relation';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(12; "Insert Value"; Boolean)
        {
            Caption = 'Insert Value';
        }
        field(13; Progressive; Boolean)
        {
            Caption = 'Progressive';
        }
        field(14; "Field Type"; Option)
        {
            Caption = 'Field Type';
            OptionCaption = 'Field,Attribute';
            OptionMembers = "Field","Attribute";

            trigger OnValidate()
            var
                FieldType: Integer;
                CharacterNo: Integer;
                FieldCharacterNo: Integer;
            begin
                if xRec."Field Type" <> "Field Type" then begin
                    FieldType := "Field Type";
                    CharacterNo := "Character No.";
                    FieldCharacterNo := "Field Character No.";
                    init;
                    "Field Type" := FieldType;
                    "Character No." := CharacterNo;
                    "Field Character No." := FieldCharacterNo;
                end;
            end;
        }
        field(15; "Item Type"; Option)
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Master,Finished Product';
            OptionMembers = " ",Master,"Finished Product";
        }

    }

    keys
    {
        key(Key1; "Table No.", "Field Name", "Field No.", "Entry No.", "Procurement System", "Item Type")
        {
        }
        key(Key2; "Field Name", "Character No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Field Name" = "field name"::"No." then
            TestField("Field Character No.");
    end;

    var
        pgFields: Page "CFG Field Virtual Table";
        ItemAttribute: Record "Item Attribute";
        ItemAttributes: page "Item Attributes";
        rcFields: Record "Field";
        i: Integer;
        GCount: Integer;
        txtErrorNr: label '"No." value has to be less then 20';
        RcLookup: Record "CFG Lookup Table Configurator";
        RcConditions: Record "CFG Conf. Condition Specif.";
        EntryNo: Integer;
        rcItemConfiguratorCodeAux: Record "CFG Item Configurator Code";

    procedure CheckandCreateCharacterNo(PFieldName: Option; PPurchaseBoolean: Boolean; PItemType: Integer) i: Integer
    var
        LRcSetupAux: Record "CFG Item Configurator Code";
    begin
        i := 1;
        LRcSetupAux.Reset;
        LRcSetupAux.SetCurrentkey("Field Name", "Character No.");
        LRcSetupAux.SetRange("Field Name", PFieldName);
        if (PPurchaseBoolean = true) then
            LRcSetupAux.SetRange("Procurement System", LRcSetupAux."procurement system"::Purchase);
        if (PPurchaseBoolean = false) then
            LRcSetupAux.SetRange("Procurement System", LRcSetupAux."procurement system"::"Prod. Order");
        LRcSetupAux.SetRange("Item Type", PItemType);
        if LRcSetupAux.FindLast then
            i := LRcSetupAux."Character No." + 1;
        if (i > 20) and ((Format("Field Name") = 'No.') or (Format("Field Name") = 'Nr.')) then
            Error(txtErrorNr);
        exit(i);
    end;
}

