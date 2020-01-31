Page 18100607 "CFG Lookup Table Configurator"//18100607
{
    Caption = 'Relationed Tables';
    PageType = List;
    SourceTable = "CFG Lookup Table Configurator";

    layout
    {
        area(content)
        {
            repeater(Generale)
            {
                field("Field No."; "Field No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Field Name"; "Field Name")
                {
                    ApplicationArea = Basic;
                }
                field("Table Relation No."; "Table Relation No.")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(pgObject);
                        rcObject.Reset;
                        rcObject.FilterGroup(2);
                        rcObject.SetRange("Object Type", rcObject."Object Type"::Table);
                        rcObject.FilterGroup(0);
                        pgObject.SetTableview(rcObject);
                        pgObject.SetRecord(rcObject);
                        pgObject.LookupMode(true);
                        if pgObject.RunModal = Action::LookupOK then begin
                            pgObject.GetRecord(rcObject);
                            "Table Relation No." := rcObject."Object ID";
                        end;
                        CurrPage.Update;
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Table Relation Name"; "Table Relation Name")
                {
                    ApplicationArea = Basic;
                }
                field("Field Relation No."; "Field Relation No.")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(pgFields);
                        rcFields.Reset;
                        rcFields.FilterGroup(2);
                        rcFields.SetRange(TableNo, "Table Relation No.");
                        rcFields.SetFilter(rcFields.Type, '%1 | %2', rcFields.Type::Code, rcFields.Type::Text);
                        rcFields.FilterGroup(0);
                        pgFields.SetTableview(rcFields);
                        pgFields.SetRecord(rcFields);
                        pgFields.LookupMode(true);
                        if pgFields.RunModal = Action::LookupOK then begin
                            pgFields.GetRecord(rcFields);
                            "Field Relation No." := rcFields."No.";
                            "Field Relation Name" := rcFields.FieldName;
                        end;
                        CurrPage.Update;
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Field Relation Name"; "Field Relation Name")
                {
                    ApplicationArea = Basic;
                }
                field(Condition; Condition)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Table Relation Filters")
            {
                ApplicationArea = Basic;
                Caption = 'Table Relation Filters';
                Image = EditFilter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CFGItemConfiguratorCode: Record "CFG Item Configurator Code";
                begin
                    CFGItemConfiguratorCode.Setfilter("Table No.", GetFilter("Table No."));
                    CFGItemConfiguratorCode.SetFilter("Field No.", GetFilter("Field No."));
                    CFGItemConfiguratorCode.SetFilter("Entry No.", GetFilter("Entry No."));
                    CFGItemConfiguratorCode.FindFirst();

                    CFGItemConfiguratorCode.TestField("Field Type", CFGItemConfiguratorCode."Field Type"::Field);

                    FilterGroup(2);
                    RcFilters.SetRange("Table No.", "Table No.");
                    RcFilters.SetRange("Field No.", "Field No.");
                    RcFilters.SetRange("Entry No.", "Entry No.");
                    FilterGroup(0);
                    PgFilters."TableNo&FieldNo"("Table No.", "Field No.", "Entry No.");
                    Page.Run(Page::"CFG Table Relation Filters", RcFilters);
                end;
            }
            action("Relation Condition")
            {
                ApplicationArea = Basic;
                Caption = 'Relation Condition';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CFGItemConfiguratorCode: Record "CFG Item Configurator Code";
                begin
                    CFGItemConfiguratorCode.Setfilter("Table No.", GetFilter("Table No."));
                    CFGItemConfiguratorCode.SetFilter("Field No.", GetFilter("Field No."));
                    CFGItemConfiguratorCode.SetFilter("Entry No.", GetFilter("Entry No."));
                    CFGItemConfiguratorCode.FindFirst();

                    CFGItemConfiguratorCode.TestField("Field Type", CFGItemConfiguratorCode."Field Type"::Field);

                    FilterGroup(2);
                    RcCondition.SetRange("Table No.", "Table No.");
                    RcCondition.SetRange("Field No.", "Field No.");
                    RcCondition.SetRange("Entry No.", "Entry No.");
                    FilterGroup(0);
                    PgCondition."TableNo&FieldNo"("Table No.", "Field No.", "Entry No.");
                    Page.Run(Page::"CFG Condition Specification", RcCondition);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage.Update;
    end;

    var
        pgFields: Page Fields;
        rcFields: Record "Field";
        rcObject: Record AllObjWithCaption;
        pgObject: Page "All Objects with Caption";
        RcFilters: Record "CFG Table Relation Filters";
        PgFilters: Page "CFG Table Relation Filters";
        RcCondition: Record "CFG Conf. Condition Specif.";
        PgCondition: Page "CFG Condition Specification";

    procedure "TableNo&FieldNo"(PTableNo: Integer; PFieldNo: Integer; PRelTableNo: Integer; PRelFieldNo: Integer)
    begin
        Reset;
        FilterGroup(2);
        SetRange("Table No.", PTableNo);
        SetRange("Field No.", PFieldNo);
        FilterGroup(0);
        if IsEmpty then begin
            Init;
            "Table No." := PTableNo;
            "Field No." := PFieldNo;
            "Table Relation No." := PRelTableNo;
            "Field Relation No." := PRelFieldNo;
            if not Insert then
                Modify;
        end;
    end;
}

