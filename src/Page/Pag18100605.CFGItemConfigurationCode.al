Page 18100605 "CFG Item Configuration Code"//18100605
{
    Caption = 'Item Configuration';
    DataCaptionExpression = PageDescription;
    UsageCategory = Tasks;
    ApplicationArea = All;
    DelayedInsert = true;
    PageType = List;
    SourceTable = "CFG Item Configurator Code";
    SourceTableView = sorting("Field Name", "Character No.")
                      order(ascending);

    layout
    {
        area(content)
        {
            group("Filter")
            {
                Caption = 'Filter';
                field("Procurement System Filter"; optProcSyst)
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement System Filter';
                    OptionCaption = 'Purchase,Prod. Order,Production BOM';

                    trigger OnValidate()
                    begin
                        Reset;
                        SetCurrentkey("Field Name", "Character No.");
                        FilterGroup(20);
                        SetRange("Procurement System", optProcSyst);
                        SetRange("Item Type", optItemType);
                        FilterGroup(0);
                        CurrPage.Update(false);
                    end;

                }

                field("Item Type Filter"; optItemType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Type Filter';
                    OptionCaption = ' ,Master,Finished Product';

                    trigger OnValidate()
                    begin
                        Reset;
                        SetCurrentkey("Field Name", "Character No.");
                        FilterGroup(20);
                        SetRange("Procurement System", optProcSyst);
                        SetRange("Item Type", optItemType);
                        FilterGroup(0);
                        CurrPage.Update(false);
                    end;
                }
            }
            //group(Righe)
            //{
            //Caption = 'Lines';
            repeater(RepeaterControl)
            {
                field("Table No."; "Table No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procurement System"; "Procurement System")
                {
                    ApplicationArea = Basic;
                }

                field("Item Type"; "Item Type")
                {
                    ApplicationArea = Basic;
                }

                field("Field Name"; "Field Name")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Field := '';
                        "Field No." := 0;

                        if ("Procurement System" = "procurement system"::Purchase) then
                            "Character No." := CheckandCreateCharacterNo("Field Name", true, "Item Type")
                        else
                            if ("Procurement System" = "procurement system"::"Prod. Order") then
                                "Character No." := CheckandCreateCharacterNo("Field Name", false, "Item Type");

                        rcLookup.Init;
                        rcLookup."Table No." := "Table No.";
                        rcLookup."Field No." := "Field No.";
                        rcLookup."Entry No." := "Entry No.";
                        rcLookup."Table Relation No." := "Table No. Relation";
                        rcLookup."Field Relation No." := "Field No. Relation";
                        if not rcLookup.Insert then
                            rcLookup.Modify;
                    end;
                }
                field("Character No."; "Character No.")
                {
                    ApplicationArea = Basic;
                }
                field("Field No."; "Field No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Field Type"; "Field Type")
                {
                    ApplicationArea = Basic;

                }
                field("Field"; Field)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Field Character No."; "Field Character No.")
                {
                    ApplicationArea = Basic;
                }
                field(Progressive; Progressive)
                {
                    ApplicationArea = Basic;
                }
                field("Table No. Relation"; "Table No. Relation")
                {
                    ApplicationArea = Basic;
                }
                field("Field No. Relation"; "Field No. Relation")
                {
                    ApplicationArea = Basic;
                }
                field("Customed Relation"; "Customed Relation")
                {
                    ApplicationArea = Basic;
                }
                field("Insert Value"; "Insert Value")
                {
                    ApplicationArea = Basic;
                }
            }
            //}
        }
    }

    actions
    {
        area(processing)
        {
            group("Item Creation")
            {
                Caption = 'Item';
                Image = Item;
                group(Item)
                {
                    Caption = 'Item Creation';
                    Image = Item;
                    action("Create Purchase Item")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Purchase Item';
                        Image = NewItem;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        begin
                            pgCreateItem.SetProcSystem(true, optItemType);
                            pgCreateItem.Run;
                        end;
                    }
                    action("Create Production Item")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Production Item';
                        Image = Process;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        begin
                            pgCreateItem.SetProcSystem(false, optItemType);
                            pgCreateItem.Run;
                        end;
                    }
                    action("Create Production BOM")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Create Production BOM';
                        Image = BOM;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        begin
                            pgCreateItem.SetProcSystem(false, optItemType);
                            pgCreateItem.IsProductionBOM(optItemType);
                            pgCreateItem.Run;
                        end;
                    }
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if ("Procurement System" = "procurement system"::Purchase) then
            "Character No." := CheckandCreateCharacterNo("Field Name", true, "Item Type")
        else
            if ("Procurement System" = "procurement system"::"Prod. Order") then
                "Character No." := CheckandCreateCharacterNo("Field Name", false, "Item Type");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Table No." := Database::Item;
    end;

    trigger OnOpenPage()
    begin
        optProcSyst := Optprocsyst::Purchase;
        optItemType := optItemType::" ";
        Reset;
        SetCurrentkey("Field Name", "Character No.");
        FilterGroup(20);
        SetRange("Procurement System", Optprocsyst::Purchase);
        SetRange("Item Type", optItemType::" ");
        FilterGroup(0);
    end;

    local procedure GetCaption(): Text[250]
    begin

    end;

    var
        GField: Code[20];
        i: Integer;
        rcLookup: Record "CFG Lookup Table Configurator";
        pgLookup: Page "CFG Lookup Table Configurator";
        txtRelError: label '"Relationed Field No." has already valued';
        pgCreateItem: Page "CFG Create Item";
        cdu50000: Codeunit "CFG Item Attributes Conf.";
        optProcSyst: Option Purchase,"Prod. Order","Production BOM";
        optItemType: Option " ","Master","Finished Product";
        PageDescription: Label 'Item Configurator';

}

