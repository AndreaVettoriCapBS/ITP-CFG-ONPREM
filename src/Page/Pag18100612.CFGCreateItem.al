Page 18100612 "CFG Create Item"//18100612
{
    Caption = 'Create Item';
    PageType = Card;

    layout
    {
        area(content)
        {
            group(Generale)
            {
                Caption = 'General';
                /*Visible = not IsBOM;
                field("Item Category"; ItemCat)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Category';
                    Visible = not IsBOM;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(pgItemCat);
                        rcItemCategory.Reset;
                        pgItemCat.SetTableview(rcItemCategory);
                        pgItemCat.SetRecord(rcItemCategory);
                        pgItemCat.LookupMode(true);
                        if pgItemCat.RunModal = Action::LookupOK then begin
                            pgItemCat.GetRecord(rcItemCategory);
                            ItemCat := rcItemCategory.Code;
                        end;
                    end;
                }
                field("Base Unit of Measure"; UM)
                {
                    ApplicationArea = Basic;
                    Caption = 'Base Unit of Measure';
                    LookupPageID = "Units of Measure";
                    Visible = not IsBOM;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(pgUnitOfMesure);
                        rcUnitOfMesure.Reset;
                        pgUnitOfMesure.SetTableview(rcUnitOfMesure);
                        pgUnitOfMesure.SetRecord(rcUnitOfMesure);
                        pgUnitOfMesure.LookupMode(true);
                        if pgUnitOfMesure.RunModal = Action::LookupOK then begin
                            pgUnitOfMesure.GetRecord(rcUnitOfMesure);
                            UM := rcUnitOfMesure.Code;
                        end;
                    end;
                }*/
                field("Procurement System"; optProcSyst)
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement System';
                    Editable = false;
                    OptionCaption = 'Purchase,Prod. Order,Production BOM';
                    Visible = not IsBOM;
                }

                field("Item Type"; optItemType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Type';
                    Editable = false;
                    OptionCaption = ' ,Master,Finished Product';
                }
            }
            group("Campi Generazione Codice")
            {
                Caption = 'Code Generation Fields';
                field("Vars[1]"; Vars[1])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass1;
                    Visible = blVisible1;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[1] = GArray[1]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(1, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(1, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass1, Vars[1], GArray[1], AttributeArray[1]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[1] := LookUpConfig(1);
                        SetNextField(txtCaptionClass1, Vars[1], GArray[1], AttributeArray[1]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[2]"; Vars[2])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass2;
                    Editable = BlEditable2;
                    Visible = blVisible2;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[2] = GArray[2]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(2, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(2, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass2, Vars[2], GArray[2], AttributeArray[2]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[2] := LookUpConfig(2);
                        SetNextField(txtCaptionClass2, Vars[2], GArray[2], AttributeArray[2]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[3]"; Vars[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass3;
                    Editable = BlEditable3;
                    Visible = blVisible3;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[3] = GArray[3]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(3, false) then begin
                                    CurrPage.Update;
                                end
                            end;
                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(3, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass3, Vars[3], GArray[3], AttributeArray[3]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[3] := LookUpConfig(3);
                        SetNextField(txtCaptionClass3, Vars[3], GArray[3], AttributeArray[3]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[4]"; Vars[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass4;
                    Editable = BlEditable4;
                    Visible = blVisible4;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[4] = GArray[4]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(4, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(4, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass4, Vars[4], GArray[4], AttributeArray[4]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[4] := LookUpConfig(4);
                        SetNextField(txtCaptionClass4, Vars[4], GArray[4], AttributeArray[4]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[5]"; Vars[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass5;
                    Editable = BlEditable5;
                    Visible = blVisible5;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[5] = GArray[5]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(5, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(5, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass5, Vars[5], GArray[5], AttributeArray[5]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[5] := LookUpConfig(5);
                        SetNextField(txtCaptionClass5, Vars[5], GArray[5], AttributeArray[5]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[6]"; Vars[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass6;
                    Editable = BlEditable6;
                    Visible = blVisible6;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[6] = GArray[6]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(6, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(6, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass6, Vars[6], GArray[6], AttributeArray[6]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[6] := LookUpConfig(6);
                        SetNextField(txtCaptionClass6, Vars[6], GArray[6], AttributeArray[6]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[7]"; Vars[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass7;
                    Editable = BlEditable7;
                    Visible = blVisible7;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[7] = GArray[7]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(7, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(7, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass7, Vars[7], GArray[7], AttributeArray[7]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[7] := LookUpConfig(7);
                        SetNextField(txtCaptionClass7, Vars[7], GArray[7], AttributeArray[7]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[8]"; Vars[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass8;
                    Editable = BlEditable8;
                    Visible = blVisible8;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[8] = GArray[8]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(8, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(8, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass8, Vars[8], GArray[8], AttributeArray[8]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[8] := LookUpConfig(8);
                        SetNextField(txtCaptionClass8, Vars[8], GArray[8], AttributeArray[8]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[9]"; Vars[9])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass9;
                    Editable = BlEditable9;
                    Visible = blVisible9;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[9] = GArray[9]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(9, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(9, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass9, Vars[9], GArray[9], AttributeArray[9]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[9] := LookUpConfig(9);
                        SetNextField(txtCaptionClass9, Vars[9], GArray[9], AttributeArray[9]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[10]"; Vars[10])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass10;
                    Editable = BlEditable10;
                    Visible = blVisible10;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[10] = GArray[10]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(10, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(10, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass10, Vars[10], GArray[10], AttributeArray[10]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[10] := LookUpConfig(10);
                        SetNextField(txtCaptionClass10, Vars[10], GArray[10], AttributeArray[10]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[11]"; Vars[11])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass11;
                    Editable = BlEditable11;
                    Visible = blVisible11;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[11] = GArray[11]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(11, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(11, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass11, Vars[11], GArray[11], AttributeArray[11]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[11] := LookUpConfig(11);
                        SetNextField(txtCaptionClass11, Vars[11], GArray[11], AttributeArray[11]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[12]"; Vars[12])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass12;
                    Editable = BlEditable12;
                    Visible = blVisible12;

                    trigger OnAssistEdit()
                    begin

                        if (ProgressiveArray[12] = GArray[12]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(12, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(12, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass12, Vars[12], GArray[12], AttributeArray[12]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[12] := LookUpConfig(12);
                        SetNextField(txtCaptionClass12, Vars[12], GArray[12], AttributeArray[12]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[13]"; Vars[13])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass13;
                    Editable = BlEditable13;
                    Visible = blVisible13;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[13] = GArray[13]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(13, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(13, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass13, Vars[13], GArray[13], AttributeArray[13]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[13] := LookUpConfig(13);
                        SetNextField(txtCaptionClass13, Vars[13], GArray[13], AttributeArray[13]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[14]"; Vars[14])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass14;
                    Editable = BlEditable14;
                    Visible = blVisible14;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[14] = GArray[14]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(14, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(14, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass14, Vars[14], GArray[14], AttributeArray[14]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[14] := LookUpConfig(14);
                        SetNextField(txtCaptionClass14, Vars[14], GArray[14], AttributeArray[14]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[15]"; Vars[15])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass15;
                    Editable = BlEditable15;
                    Visible = blVisible15;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[15] = GArray[15]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(15, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(15, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass15, Vars[15], GArray[15], AttributeArray[15]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[15] := LookUpConfig(15);
                        SetNextField(txtCaptionClass15, Vars[15], GArray[15], AttributeArray[15]);
                        CurrPage.Update;
                    end;

                }
                field("Vars[16]"; Vars[16])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass16;
                    Editable = BlEditable16;
                    Visible = blVisible16;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[16] = GArray[16]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(16, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(16, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass16, Vars[16], GArray[16], AttributeArray[16]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[16] := LookUpConfig(16);
                        SetNextField(txtCaptionClass16, Vars[16], GArray[16], AttributeArray[16]);
                        CurrPage.Update;
                    end;

                }
                field("Vars[17]"; Vars[17])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass17;
                    Editable = BlEditable17;
                    Visible = blVisible17;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[17] = GArray[17]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(17, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(17, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass17, Vars[17], GArray[17], AttributeArray[17]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[17] := LookUpConfig(17);
                        SetNextField(txtCaptionClass17, Vars[17], GArray[17], AttributeArray[17]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[18]"; Vars[18])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass18;
                    Editable = BlEditable18;
                    Visible = blVisible18;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[18] = GArray[18]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(18, false) then begin
                                    CurrPage.Update;
                                end
                            end;

                        if (optProcSyst = Optprocsyst::Purchase) then begin
                            if AssistEdit(18, true) then begin
                                CurrPage.Update;
                            end;
                        end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass17, Vars[17], GArray[17], AttributeArray[17]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[18] := LookUpConfig(18);
                        SetNextField(txtCaptionClass17, Vars[17], GArray[17], AttributeArray[17]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[19]"; Vars[19])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass19;
                    Editable = BlEditable19;
                    Visible = blVisible19;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[19] = GArray[19]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(19, false) then begin
                                    CurrPage.Update;
                                end
                                else
                                    if AssistEdit(19, true) then begin
                                        CurrPage.Update;
                                    end;
                            end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass19, Vars[19], GArray[19], AttributeArray[19]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[19] := LookUpConfig(19);
                        SetNextField(txtCaptionClass19, Vars[19], GArray[19], AttributeArray[19]);
                        CurrPage.Update;
                    end;
                }
                field("Vars[20]"; Vars[20])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass20;
                    Editable = BlEditable20;
                    Visible = blVisible20;

                    trigger OnAssistEdit()
                    begin
                        if (ProgressiveArray[20] = GArray[20]) then
                            if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                                if AssistEdit(20, false) then begin
                                    CurrPage.Update;
                                end
                                else
                                    if AssistEdit(20, true) then begin
                                        CurrPage.Update;
                                    end;
                            end;
                    end;

                    trigger OnValidate()
                    begin
                        SetNextField(txtCaptionClass20, Vars[20], GArray[20], AttributeArray[20]);
                        CurrPage.Update;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[19] := LookUpConfig(19);
                        SetNextField(txtCaptionClass20, Vars[20], GArray[20], AttributeArray[20]);
                        CurrPage.Update;
                    end;
                }
            }
            group("Campi Generazione Descrizione")
            {
                Caption = 'Description Generation Fields';
                field("Vars[21]"; Vars[21])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass21;
                    Visible = blVisible21;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[21] := LookUpConfig(21);
                    end;
                }
                field("Vars[22]"; Vars[22])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass22;
                    Visible = blVisible22;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[22] := LookUpConfig(22);
                    end;
                }
                field("Vars[23]"; Vars[23])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass23;
                    Visible = blVisible23;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[23] := LookUpConfig(23);
                    end;
                }
                field("Vars[24]"; Vars[24])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass24;
                    Visible = blVisible24;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[24] := LookUpConfig(24);
                    end;
                }
                field("Vars[25]"; Vars[25])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass25;
                    Visible = blVisible25;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[25] := LookUpConfig(25);
                    end;
                }
                field("Vars[26]"; Vars[26])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass26;
                    Visible = blVisible26;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[26] := LookUpConfig(26);
                    end;
                }
                field("Vars[27]"; Vars[27])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass27;
                    Visible = blVisible27;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[27] := LookUpConfig(27);
                    end;
                }
                field("Vars[28]"; Vars[28])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass28;
                    Visible = blVisible28;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[28] := LookUpConfig(28);
                    end;
                }
                field("Vars[29]"; Vars[29])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass29;
                    Visible = blVisible29;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[29] := LookUpConfig(29);
                    end;
                }
                field("Vars[30]"; Vars[30])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass30;
                    Visible = blVisible30;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[30] := LookUpConfig(30);
                    end;
                }
                field("Vars[31]"; Vars[31])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass31;
                    Visible = blVisible31;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[31] := LookUpConfig(31);
                    end;
                }
                field("Vars[32]"; Vars[32])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass32;
                    Visible = blVisible32;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[32] := LookUpConfig(32);
                    end;
                }
                field("Vars[33]"; Vars[33])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass33;
                    Visible = blVisible33;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[33] := LookUpConfig(33);
                    end;
                }
                field("Vars[34]"; Vars[34])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass34;
                    Visible = blVisible34;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[34] := LookUpConfig(34);
                    end;
                }
                field("Vars[35]"; Vars[35])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass35;
                    Visible = blVisible35;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[35] := LookUpConfig(35);
                    end;
                }
                field("Vars[36]"; Vars[36])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass36;
                    Visible = blVisible36;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[36] := LookUpConfig(36);
                    end;
                }
                field("Vars[37]"; Vars[37])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass37;
                    Visible = blVisible37;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[37] := LookUpConfig(37);
                    end;
                }
                field("Vars[38]"; Vars[38])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass38;
                    Visible = blVisible38;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[38] := LookUpConfig(38);
                    end;
                }
                field("Vars[39]"; Vars[39])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass39;
                    Visible = blVisible39;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[39] := LookUpConfig(39);
                    end;
                }
                field("Vars[40]"; Vars[40])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass40;
                    Visible = blVisible40;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[40] := LookUpConfig(40);
                    end;
                }
                field("Vars[41]"; Vars[41])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass41;
                    Visible = blVisible41;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[41] := LookUpConfig(41);
                    end;
                }
                field("Vars[42]"; Vars[42])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass42;
                    Visible = blVisible42;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[42] := LookUpConfig(42);
                    end;
                }
                field("Vars[43]"; Vars[43])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass43;
                    Visible = blVisible43;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[43] := LookUpConfig(43);
                    end;
                }
                field("Vars[44]"; Vars[44])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass44;
                    Visible = blVisible44;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[44] := LookUpConfig(44);
                    end;
                }
                field("Vars[45]"; Vars[45])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass45;
                    Visible = blVisible45;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[45] := LookUpConfig(45);
                    end;
                }
                field("Vars[46]"; Vars[46])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass46;
                    Visible = blVisible46;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[46] := LookUpConfig(46);
                    end;
                }
                field("Vars[47]"; Vars[47])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass47;
                    Visible = blVisible47;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[47] := LookUpConfig(47);
                    end;
                }
                field("Vars[48]"; Vars[48])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass48;
                    Visible = blVisible48;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[48] := LookUpConfig(48);
                    end;
                }
                field("Vars[49]"; Vars[49])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass49;
                    Visible = blVisible49;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[49] := LookUpConfig(49);
                    end;
                }
                field("Vars[50]"; Vars[50])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass50;
                    Visible = blVisible50;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[50] := LookUpConfig(50);
                    end;
                }
                field("Vars[51]"; Vars[51])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass51;
                    Visible = blVisible51;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[51] := LookUpConfig(51);
                    end;
                }
                field("Vars[52]"; Vars[52])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass52;
                    Visible = blVisible52;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[52] := LookUpConfig(52);
                    end;
                }
                field("Vars[53]"; Vars[53])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass53;
                    Visible = blVisible53;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[53] := LookUpConfig(53);
                    end;
                }
                field("Vars[54]"; Vars[54])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass54;
                    Visible = blVisible54;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[54] := LookUpConfig(54);
                    end;
                }
                field("Vars[55]"; Vars[55])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass55;
                    Visible = blVisible55;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[55] := LookUpConfig(55);
                    end;
                }
                field("Vars[56]"; Vars[56])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass56;
                    Visible = blVisible56;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[56] := LookUpConfig(56);
                    end;
                }
                field("Vars[57]"; Vars[57])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass57;
                    Visible = blVisible57;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[57] := LookUpConfig(57);
                    end;
                }
                field("Vars[58]"; Vars[58])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass58;
                    Visible = blVisible58;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[58] := LookUpConfig(58);
                    end;
                }
                field("Vars[59]"; Vars[59])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass59;
                    Visible = blVisible59;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[59] := LookUpConfig(59);
                    end;
                }
                field("Vars[60]"; Vars[60])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass60;
                    Visible = blVisible60;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[60] := LookUpConfig(60);
                    end;
                }
                field("Vars[61]"; Vars[61])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass61;
                    Visible = blVisible61;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[61] := LookUpConfig(61);
                    end;
                }
                field("Vars[62]"; Vars[62])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass62;
                    Visible = blVisible62;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[62] := LookUpConfig(62);
                    end;
                }
                field("Vars[63]"; Vars[63])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass63;
                    Visible = blVisible63;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[63] := LookUpConfig(63);
                    end;
                }
                field("Vars[64]"; Vars[64])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass64;
                    Visible = blVisible64;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[64] := LookUpConfig(64);
                    end;
                }
                field("Vars[65]"; Vars[65])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass65;
                    Visible = blVisible65;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[65] := LookUpConfig(65);
                    end;
                }
                field("Vars[66]"; Vars[66])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass66;
                    Visible = blVisible66;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[66] := LookUpConfig(66);
                    end;
                }
                field("Vars[67]"; Vars[67])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass67;
                    Visible = blVisible27;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[67] := LookUpConfig(67);
                    end;
                }
                field("Vars[68]"; Vars[68])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass68;
                    Visible = blVisible28;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[68] := LookUpConfig(68);
                    end;
                }
                field("Vars[69]"; Vars[69])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass69;
                    Visible = blVisible69;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[69] := LookUpConfig(69);
                    end;
                }
                field("Vars[70]"; Vars[70])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass70;
                    Visible = blVisible70;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[70] := LookUpConfig(70);
                    end;
                }
                field("Vars[71]"; Vars[71])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass71;
                    Visible = blVisible71;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[71] := LookUpConfig(71);
                    end;
                }
            }
            group("Campi Valore")
            {
                Caption = 'Value Fields';
                field("Vars[72]"; Vars[72])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass72;
                    Visible = blVisible72;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[72] := LookUpConfig(72);
                    end;
                }
                field("Vars[73]"; Vars[73])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass73;
                    Visible = blVisible73;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[73] := LookUpConfig(73);
                    end;
                }
                field("Vars[74]"; Vars[74])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass74;
                    Visible = blVisible74;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[74] := LookUpConfig(74);
                    end;
                }
                field("Vars[75]"; Vars[75])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass75;
                    Visible = blVisible75;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[75] := LookUpConfig(75);
                    end;
                }
                field("Vars[76]"; Vars[76])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass76;
                    Visible = blVisible76;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[76] := LookUpConfig(76);
                    end;
                }
                field("Vars[77]"; Vars[77])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass77;
                    Visible = blVisible77;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[77] := LookUpConfig(77);
                    end;
                }
                field("Vars[78]"; Vars[78])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass78;
                    Visible = blVisible78;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[78] := LookUpConfig(78);
                    end;
                }
                field("Vars[79]"; Vars[79])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass79;
                    Visible = blVisible79;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[79] := LookUpConfig(79);
                    end;
                }
                field("Vars[80]"; Vars[80])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass80;
                    Visible = blVisible80;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[80] := LookUpConfig(80);
                    end;
                }
                field("Vars[81]"; Vars[81])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass81;
                    Visible = blVisible81;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[81] := LookUpConfig(81);
                    end;
                }
                field("Vars[82]"; Vars[82])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass82;
                    Visible = blVisible82;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[82] := LookUpConfig(82);
                    end;
                }
                field("Vars[83]"; Vars[83])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass83;
                    Visible = blVisible83;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[83] := LookUpConfig(83);
                    end;
                }
                field("Vars[84]"; Vars[84])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass84;
                    Visible = blVisible84;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[84] := LookUpConfig(84);
                    end;
                }
                field("Vars[85]"; Vars[85])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass85;
                    Visible = blVisible85;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[85] := LookUpConfig(85);
                    end;
                }
                field("Vars[86]"; Vars[86])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass86;
                    Visible = blVisible86;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[86] := LookUpConfig(86);
                    end;
                }
                field("Vars[87]"; Vars[87])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass87;
                    Visible = blVisible87;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[87] := LookUpConfig(87);
                    end;
                }
                field("Vars[88]"; Vars[88])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass88;
                    Visible = blVisible88;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[88] := LookUpConfig(88);
                    end;
                }
                field("Vars[89]"; Vars[89])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass89;
                    Visible = blVisible89;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[89] := LookUpConfig(89);
                    end;
                }
                field("Vars[90]"; Vars[90])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass90;
                    Visible = blVisible90;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[90] := LookUpConfig(90);
                    end;
                }
                field("Vars[91]"; Vars[91])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass91;
                    Visible = blVisible91;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[91] := LookUpConfig(91);
                    end;
                }
                field("Vars[92]"; Vars[92])
                {
                    ApplicationArea = Basic;
                    CaptionClass = txtCaptionClass92;
                    Visible = blVisible92;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Vars[92] := LookUpConfig(92);
                    end;
                }
                field("Finished Product"; FinishedProduct)
                {
                    ApplicationArea = Basic;
                    Caption = 'Finished Product';
                    Visible = IsBOM;
                    TableRelation = Item;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Item")
            {
                ApplicationArea = Basic;
                Caption = 'Create Item';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = not IsBOM;

                trigger OnAction()
                var
                    ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
                    ItemAttributeValue: Record "Item Attribute Value";
                    ItemAttribute: Record "Item Attribute";
                    Item: record Item;
                    ItemMaster: record Item;
                begin
                    tmpItem.reset;
                    tmpItem.DeleteAll();

                    SumDim := Dim1 + Dim2 - 20;

                    RecRefCheck.Close;
                    RecRefCheck.Open(database::Item);

                    j := 20;
                    for i := 1 to SumDim do begin
                        case i of
                            1:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            2:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            3:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            4:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            5:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            6:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            7:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            8:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            9:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            10:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            11:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            12:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            13:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            14:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            15:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            16:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            17:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            18:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            19:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            20:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            21:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            22:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            23:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            24:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            25:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            26:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            27:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            28:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            29:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            30:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            31:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            32:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            33:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            34:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            35:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            36:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            37:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            38:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            39:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            40:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            41:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            42:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            43:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            44:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            45:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            46:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            47:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            48:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            49:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            50:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            51:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            52:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            53:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            54:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            55:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            56:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            57:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            58:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            59:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            60:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            61:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            62:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            63:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            64:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            65:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            66:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            67:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            68:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            69:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            70:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                            71:
                                begin
                                    if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                        GenerateCode(i)
                                    else
                                        GenerateDescription(i);
                                end;
                        end;
                    end;

                    ItemCode := '';
                    for i := 1 to Dim1 do begin
                        ItemCode += Format(CodeGenerationArray[i]);
                    end;

                    ItemDescription := '';

                    for i := 21 to Dim2 do begin
                        if ItemDescription <> '' then
                            ItemDescription := StrSubstNo('%1 %2', ItemDescription, DescriptionGenerationArray[i])
                        else
                            ItemDescription := DescriptionGenerationArray[i];
                    end;
                    if StrLen(ItemDescription) > 50 then begin
                        Message(txtCOPYSTR);
                        ItemDescription := CopyStr(ItemDescription, 1, 50);
                    end;

                    RRef.Close;
                    RRef.Open(ItemConfSetup."Table No.");
                    RRef.Init;

                    FRef := RRef.Field(1);
                    FRef.Value := ItemCode;

                    FRef := RRef.Field(3);
                    FRef.Value := ItemDescription;

                    Clear(BlExit);

                    if (not RecRefCheck.IsEmpty) AND (not tmpItem.IsEmpty) then
                        if not Confirm(txtItemCheck) then
                            BlExit := true;

                    RecRefCheck.Close;

                    if not BlExit then begin

                        RRef.Insert;

                        FRef := RRef.Field(4);
                        FRef.Validate(ItemDescription);

                        if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                            FRef := RRef.Field(6500);
                            FRef.Validate(Setup."Prod. Item Tracking No.");
                        end else
                            if (optProcSyst = Optprocsyst::Purchase) then begin
                                FRef := RRef.Field(6500);
                                FRef.Validate(Setup."Purch. Item Tracking No.");
                            end;

                        if (optProcSyst = Optprocsyst::"Prod. Order") then begin
                            FRef := RRef.Field(5442);
                            FRef.Validate(1);
                        end;

                        FRef := RRef.Field(8);
                        FRef.Validate(UM);

                        FRef := RRef.Field(5702);
                        FRef.Validate(ItemCat);

                        FRef := RRef.Field(5419);
                        FRef.Validate(optProcSyst);

                        FRef := RRef.Field(50010);
                        FRef.Validate(optItemType);

                        j := 72;
                        for i := 1 to Dim3 do begin
                            if (FieldNameArray[i] = 'Value') or (FieldNameArray[i] = 'Valore') then begin
                                if not AttributeArray[i] then begin
                                    FRef := RRef.Field(GArray[i]);

                                    if OptionArray[i] then begin
                                        FRef.Value := Selected[j];
                                    end
                                    else
                                        FRef.Value := Vars[j];
                                end
                                else begin
                                    ItemAttribute.get(GArray[i]);
                                    IF ItemAttributeValue.GET(GArray[i], AttributeArrayID[i]) THEN BEGIN
                                        IF NOT ItemAttributeValueMapping.GET(DATABASE::Item, ItemCode, ItemAttributeValue."Attribute ID") THEN BEGIN
                                            ItemAttributeValueMapping.RESET;
                                            ItemAttributeValueMapping.INIT;
                                            ItemAttributeValueMapping."Table ID" := DATABASE::Item;
                                            ItemAttributeValueMapping."No." := ItemCode;
                                            ItemAttributeValueMapping."Item Attribute ID" := ItemAttributeValue."Attribute ID";
                                            ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;
                                            ItemAttributeValueMapping.INSERT;
                                        END
                                        else begin
                                            ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;
                                            ItemAttributeValueMapping.modify;
                                        end;
                                    end;
                                end;
                                j += 1;
                            end;
                        end;

                        for i := 1 to j do begin
                            if AttributeArray[i] then begin
                                IF ItemAttributeValue.GET(GArray[i], AttributeArrayID[i]) THEN BEGIN
                                    IF NOT ItemAttributeValueMapping.GET(DATABASE::Item, ItemCode, ItemAttributeValue."Attribute ID") THEN BEGIN
                                        ItemAttributeValueMapping.RESET;
                                        ItemAttributeValueMapping.INIT;
                                        ItemAttributeValueMapping."Table ID" := DATABASE::Item;
                                        ItemAttributeValueMapping."No." := ItemCode;
                                        ItemAttributeValueMapping."Item Attribute ID" := ItemAttributeValue."Attribute ID";
                                        ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;
                                        ItemAttributeValueMapping.INSERT;
                                    END
                                    else begin
                                        ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;
                                        ItemAttributeValueMapping.modify;
                                    end;
                                END;
                            end
                            else begin
                                if AssignValue[i] then begin
                                    FRef := RRef.Field(GArray[i]);
                                    if OptionArray[i] then begin
                                        FRef.Value := Selected[i];
                                    end
                                    else
                                        FRef.Value := Vars[i];
                                end;
                            end;
                        end;

                        RRef.Modify;
                        RRef.Close;

                        if item.GET(ItemCode) then
                            if ItemMaster.get(item."Master Item Code") then begin
                                if item."Base Unit of Measure" = '' then
                                    item.validate("Base Unit of Measure", ItemMaster."Base Unit of Measure");
                                if item."Inventory Posting Group" = '' then
                                    item.validate("Inventory Posting Group", ItemMaster."Inventory Posting Group");
                                item.validate("Costing Method", ItemMaster."Costing Method");
                                item.validate("Gross Weight", ItemMaster."Gross Weight");
                                item.validate("Net Weight", ItemMaster."Net Weight");
                                if item."Tariff No." = '' then
                                    item.validate("Tariff No.", ItemMaster."Tariff No.");
                                if item."Gen. Prod. Posting Group" = '' then
                                    item.validate("Gen. Prod. Posting Group", ItemMaster."Gen. Prod. Posting Group");
                                item.validate("Picture", ItemMaster."Picture");
                                if item."VAT Prod. Posting Group" = '' then
                                    item.validate("VAT Prod. Posting Group", ItemMaster."VAT Prod. Posting Group");
                                if item."Global Dimension 1 Code" = '' then
                                    item.validate("Global Dimension 1 Code", ItemMaster."Global Dimension 1 Code");
                                if item."Global Dimension 2 Code" = '' then
                                    item.validate("Global Dimension 2 Code", ItemMaster."Global Dimension 2 Code");
                                if item."Sales Unit of Measure" = '' then
                                    item.validate("Sales Unit of Measure", ItemMaster."Sales Unit of Measure");
                                if item."Purch. Unit of Measure" = '' then
                                    item.validate("Purch. Unit of Measure", ItemMaster."Purch. Unit of Measure");
                                item.validate("Reordering Policy", ItemMaster."Reordering Policy");
                                item.validate("Manufacturing Policy", ItemMaster."Manufacturing Policy");
                                if item."Item Category Code" = '' then
                                    item.validate("Item Category Code", ItemMaster."Item Category Code");
                                if item."Item Tracking Code" = '' then
                                    item.validate("Item Tracking Code", ItemMaster."Item Tracking Code");
                                item."repeat" := ItemMaster."repeat";
                                item.yield := ItemMaster.yield;
                                if item."Paper Code" = '' then
                                    item."Paper Code" := ItemMaster."Paper Code";
                                if item."CONAI Material Type" = '' then
                                    item.validate("CONAI Material Type", ItemMaster."CONAI Material Type");
                                item.validate("CONAI Weight", ItemMaster."CONAI Weight");
                                item.Modify(true);
                            end;

                        Message(txtCreate, ItemCode);

                        clear(Vars);
                    end;
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
                Visible = IsBOM;

                trigger OnAction()
                var
                    ProductionBOMLine: record "Production BOM Line";
                    Item: record Item;
                    MasterItem: record Item;
                begin

                    SumDim := Dim1 + Dim2 - 20;

                    RecRefCheck.Close;
                    RecRefCheck.Open(database::item);

                    j := 20;
                    for i := 1 to SumDim do begin
                        if (i >= 1) and (i <= 71) then begin
                            if (FieldNameArray[i] = 'Nr.') or (FieldNameArray[i] = 'No.') then
                                GenerateCode(i)
                            else
                                GenerateDescription(i);
                        end;
                    end;

                    ItemCode := '';
                    for i := 1 to Dim1 do begin
                        ItemCode += Format(CodeGenerationArray[i]);
                    end;

                    ItemDescription := '';
                    for i := 21 to Dim2 do begin
                        if ItemDescription <> '' then
                            ItemDescription := StrSubstNo('%1 %2', ItemDescription, DescriptionGenerationArray[i])
                        else
                            ItemDescription := DescriptionGenerationArray[i];

                    end;
                    if StrLen(ItemDescription) > 50 then begin
                        Message(txtCOPYSTR);
                        ItemDescription := CopyStr(ItemDescription, 1, 50);
                    end;

                    RRef.Close;
                    RRef.Open(99000771);
                    RRef.Init;

                    FRef := RRef.Field(1);
                    FRef.Value := ItemCode;

                    FRef := RRef.Field(10);
                    FRef.Validate(ItemDescription);

                    FRef := RRef.Field(45);
                    FRef.Validate(0);

                    FRef := RRef.Field(40);
                    FRef.Validate(Today);

                    if Item.Get(FinishedProduct) then begin
                        FRef := RRef.Field(21);
                        FRef.Validate(Item."Base Unit of Measure");
                    end;

                    RRef.Insert;

                    j := 72;
                    if (FieldNameArray[j] = 'Value') or (FieldNameArray[j] = 'Valore') then begin
                        FRef := RRef.Field(50010);
                        FRef.Value := Vars[j];
                        j += 1;
                    end;

                    if (FieldNameArray[j] = 'Value') or (FieldNameArray[j] = 'Valore') then begin
                        FRef := RRef.Field(50020);
                        FRef.Value := Vars[j];
                    end;

                    RRef.Modify;
                    RRef.Close;

                    if Item.Get(FinishedProduct) then begin
                        if MasterItem.get(Item."Master Item Code") then begin
                            ProductionBOMLine.init;
                            ProductionBOMLine.Validate("Production BOM No.", ItemCode);
                            ProductionBOMLine.Validate("Line No.", 10000);
                            ProductionBOMLine.insert;
                            ProductionBOMLine.Validate(Type, ProductionBOMLine.Type::Item);
                            ProductionBOMLine.Validate("No.", MasterItem."Paper Code");
                            if MasterItem.Yield <> 0 then
                                ProductionBOMLine.Validate("Quantity per", MasterItem."Repeat" / MasterItem.Yield);
                            ProductionBOMLine.Validate(Yield, MasterItem.Yield);
                            ProductionBOMLine.Validate("Repeat", MasterItem."Repeat");
                            ProductionBOMLine.Modify(TRUE);
                        end;
                        item.Validate("Production BOM No.", ItemCode);
                        item.Modify(true);
                    end;

                    Message(txtCreateBOM, ItemCode);

                    clear(Vars);
                    clear(FinishedProduct);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if IsBOM then begin
            optProcSyst := Optprocsyst::"Production BOM";
            BlPurchase := false;
        end;

        /*
        if (BlPurchase = true) then begin
            optProcSyst := Optprocsyst::Purchase;
            BlEditable2 := false;
            BlEditable4 := false;
            BlEditable6 := false;
            BlEditable7 := false;
            BlEditable10 := true;
            BlEditable11 := false;
            BlEditable12 := false;
            BlEditable13 := false;
            BlEditable14 := false;
            BlEditable15 := false
        end else
            if (BlPurchase = false) then begin
                optProcSyst := Optprocsyst::"Prod. Order";
                BlEditable2 := true;
                BlEditable4 := false;
                BlEditable6 := true;
                BlEditable7 := true;
                BlEditable10 := false;
                BlEditable11 := false;
                BlEditable12 := false;
                BlEditable13 := false;
                BlEditable14 := true;
                BlEditable15 := false;
                BlEditable16 := false;
                BlEditable18 := false;
                BlEditable19 := false;
                BlEditable20 := false;
            end;*/

        if (BlPurchase = false) then
            optProcSyst := Optprocsyst::"Prod. Order"
        else
            optProcSyst := Optprocsyst::Purchase;

        BlEditable2 := true;
        BlEditable3 := true;
        BlEditable4 := true;
        BlEditable5 := true;
        BlEditable6 := true;
        BlEditable7 := true;
        BlEditable8 := true;
        BlEditable9 := true;
        BlEditable10 := true;
        BlEditable11 := true;
        BlEditable12 := true;
        BlEditable13 := true;
        BlEditable14 := true;
        BlEditable15 := true;
        BlEditable16 := true;
        BlEditable18 := true;
        BlEditable19 := true;
        BlEditable20 := true;

        InsertCaption;

        SetEditableProperty(TRUE, txtCaptionClass1, 1, GArray[1], AttributeArray[1]);
        SetEditableProperty(BlEditable2, txtCaptionClass2, 2, GArray[2], AttributeArray[2]);
        SetEditableProperty(BlEditable3, txtCaptionClass3, 3, GArray[3], AttributeArray[3]);
        SetEditableProperty(BlEditable4, txtCaptionClass4, 4, GArray[4], AttributeArray[4]);
        SetEditableProperty(BlEditable5, txtCaptionClass5, 5, GArray[5], AttributeArray[5]);
        SetEditableProperty(BlEditable6, txtCaptionClass6, 6, GArray[6], AttributeArray[6]);
        SetEditableProperty(BlEditable7, txtCaptionClass7, 7, GArray[7], AttributeArray[7]);
        SetEditableProperty(BlEditable8, txtCaptionClass8, 8, GArray[8], AttributeArray[8]);
        SetEditableProperty(BlEditable9, txtCaptionClass9, 9, GArray[9], AttributeArray[9]);
        SetEditableProperty(BlEditable10, txtCaptionClass10, 10, GArray[10], AttributeArray[10]);
        SetEditableProperty(BlEditable11, txtCaptionClass11, 11, GArray[11], AttributeArray[11]);
        SetEditableProperty(BlEditable12, txtCaptionClass12, 12, GArray[12], AttributeArray[12]);
        SetEditableProperty(BlEditable13, txtCaptionClass13, 13, GArray[13], AttributeArray[13]);
        SetEditableProperty(BlEditable14, txtCaptionClass14, 14, GArray[14], AttributeArray[14]);
        SetEditableProperty(BlEditable15, txtCaptionClass15, 15, GArray[15], AttributeArray[15]);
        SetEditableProperty(BlEditable16, txtCaptionClass16, 16, GArray[16], AttributeArray[16]);
        SetEditableProperty(BlEditable17, txtCaptionClass17, 17, GArray[17], AttributeArray[17]);
        SetEditableProperty(BlEditable18, txtCaptionClass18, 18, GArray[18], AttributeArray[18]);
        SetEditableProperty(BlEditable19, txtCaptionClass19, 19, GArray[19], AttributeArray[19]);
        SetEditableProperty(BlEditable20, txtCaptionClass20, 20, GArray[20], AttributeArray[20]);
    end;

    var
        BlPurchase: Boolean;
        Setup: Record "CFG Item Configurator Setup";
        BlEditable2: Boolean;
        BlEditable3: Boolean;
        BlEditable4: Boolean;
        BlEditable5: Boolean;
        BlEditable6: Boolean;
        BlEditable7: Boolean;
        BlEditable8: Boolean;
        BlEditable9: Boolean;
        BlEditable10: Boolean;
        BlEditable11: Boolean;
        BlEditable12: Boolean;
        BlEditable13: Boolean;
        BlEditable14: Boolean;
        BlEditable15: Boolean;
        BlEditable16: Boolean;
        BlEditable17: Boolean;
        BlEditable18: Boolean;
        BlEditable19: Boolean;
        BlEditable20: Boolean;
        RcTemp: Record Customer temporary;
        TxNrSeries: Text[10];
        NrSeries: Code[5];
        FoundBoolean: Boolean;
        Bl: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        "Code": Code[10];
        rcSerialNoInformation: Record "Serial No. Information";
        tabletmp: array[92] of Integer;
        fieldtmp: array[92] of Integer;
        index: Integer;
        RcCondition: Record "CFG Conf. Condition Specif.";
        RcLookupConf: Record "cfg Lookup Table Configurator";
        RcRelFilters: Record "CFG Table Relation Filters";
        VarRecRef: Variant;
        RcItem: Record Item;
        ItemCat: Code[10];
        rcItemCategory: Record "Item Category";
        pgItemCat: Page "Item Categories";
        UM: Code[10];
        rcUnitOfMesure: Record "Unit of Measure";
        pgUnitOfMesure: Page "Units of Measure";
        optProcSyst: Option Purchase,"Prod. Order","Production BOM";
        optItemType: Option " ","Master","Finished Product";
        FieldNameArray: array[100] of Text;
        EntryNoArray: array[100] of Integer;
        CompressVarAux: array[92] of Code[30];
        Vars: array[92] of Code[30];
        FinishedProduct: code[20];
        Int: Integer;
        CodeGenerationArray: array[20] of Code[20];
        AssignValue: array[100] of Boolean;
        ItemCode: Code[20];
        ItemDescription: Code[100];
        DescriptionGenerationArray: array[50] of Code[50];
        OrderNoArray: array[100] of Integer;
        OrderNoArrayDescr: array[100] of Integer;
        CharacterNoArray: array[100] of Integer;
        Gcdu50000: Codeunit "CFG Item Attributes Conf.";
        GArray: array[100] of Integer;
        ProgressiveArray: array[100] of Integer;
        AttributeArray: array[100] of Boolean;
        AttributeArrayID: array[100] of Integer;
        OptionArray: array[100] of Boolean;
        Selected: array[100] of Integer;
        RRef: RecordRef;
        FRef: FieldRef;
        ConfFRef: FieldRef;
        ConfRRef: RecordRef;
        ItemConfSetup: Record "CFG Item Configurator Code";
        i: Integer;
        j: Integer;
        rcField: Record "Field";
        SumDim: Integer;
        Dim1: Integer;
        Dim2: Integer;
        Dim3: Integer;
        RecTmpAux: Record "Purchase Line" temporary;
        blVisible1: Boolean;
        blVisible2: Boolean;
        blVisible3: Boolean;
        blVisible4: Boolean;
        blVisible5: Boolean;
        blVisible6: Boolean;
        blVisible7: Boolean;
        blVisible8: Boolean;
        blVisible9: Boolean;
        blVisible10: Boolean;
        blVisible11: Boolean;
        blVisible12: Boolean;
        blVisible13: Boolean;
        blVisible14: Boolean;
        blVisible15: Boolean;
        blVisible16: Boolean;
        blVisible17: Boolean;
        blVisible18: Boolean;
        blVisible19: Boolean;
        blVisible20: Boolean;
        blVisible21: Boolean;
        blVisible22: Boolean;
        blVisible23: Boolean;
        blVisible24: Boolean;
        blVisible25: Boolean;
        blVisible26: Boolean;
        blVisible27: Boolean;
        blVisible28: Boolean;
        blVisible29: Boolean;
        blVisible30: Boolean;
        blVisible31: Boolean;
        blVisible32: Boolean;
        blVisible33: Boolean;
        blVisible34: Boolean;
        blVisible35: Boolean;
        blVisible36: Boolean;
        blVisible37: Boolean;
        blVisible38: Boolean;
        blVisible39: Boolean;
        blVisible40: Boolean;
        blVisible41: Boolean;
        blVisible42: Boolean;
        blVisible43: Boolean;
        blVisible44: Boolean;
        blVisible45: Boolean;
        blVisible46: Boolean;
        blVisible47: Boolean;
        blVisible48: Boolean;
        blVisible49: Boolean;
        blVisible50: Boolean;
        blVisible51: Boolean;
        blVisible52: Boolean;
        blVisible53: Boolean;
        blVisible54: Boolean;
        blVisible55: Boolean;
        blVisible56: Boolean;
        blVisible57: Boolean;
        blVisible58: Boolean;
        blVisible59: Boolean;
        blVisible60: Boolean;
        blVisible61: Boolean;
        blVisible62: Boolean;
        blVisible63: Boolean;
        blVisible64: Boolean;
        blVisible65: Boolean;
        blVisible66: Boolean;
        blVisible67: Boolean;
        blVisible68: Boolean;
        blVisible69: Boolean;
        blVisible70: Boolean;
        blVisible71: Boolean;
        blVisible72: Boolean;
        blVisible73: Boolean;
        blVisible74: Boolean;
        blVisible75: Boolean;
        blVisible76: Boolean;
        blVisible77: Boolean;
        blVisible78: Boolean;
        blVisible79: Boolean;
        blVisible80: Boolean;
        blVisible81: Boolean;
        blVisible82: Boolean;
        blVisible83: Boolean;
        blVisible84: Boolean;
        blVisible85: Boolean;
        blVisible86: Boolean;
        blVisible87: Boolean;
        blVisible88: Boolean;
        blVisible89: Boolean;
        blVisible90: Boolean;
        blVisible91: Boolean;
        blVisible92: Boolean;
        txtCaptionClass1: Text;
        txtCaptionClass2: Text;
        txtCaptionClass3: Text;
        txtCaptionClass4: Text;
        txtCaptionClass5: Text;
        txtCaptionClass6: Text;
        txtCaptionClass7: Text;
        txtCaptionClass8: Text;
        txtCaptionClass9: Text;
        txtCaptionClass10: Text;
        txtCaptionClass11: Text;
        txtCaptionClass12: Text;
        txtCaptionClass13: Text;
        txtCaptionClass14: Text;
        txtCaptionClass15: Text;
        txtCaptionClass16: Text;
        txtCaptionClass17: Text;
        txtCaptionClass18: Text;
        txtCaptionClass19: Text;
        txtCaptionClass20: Text;
        txtCaptionClass21: Text;
        txtCaptionClass22: Text;
        txtCaptionClass23: Text;
        txtCaptionClass24: Text;
        txtCaptionClass25: Text;
        txtCaptionClass26: Text;
        txtCaptionClass27: Text;
        txtCaptionClass28: Text;
        txtCaptionClass29: Text;
        txtCaptionClass30: Text;
        txtCaptionClass31: Text;
        txtCaptionClass32: Text;
        txtCaptionClass33: Text;
        txtCaptionClass34: Text;
        txtCaptionClass35: Text;
        txtCaptionClass36: Text;
        txtCaptionClass37: Text;
        txtCaptionClass38: Text;
        txtCaptionClass39: Text;
        txtCaptionClass40: Text;
        txtCaptionClass41: Text;
        txtCaptionClass42: Text;
        txtCaptionClass43: Text;
        txtCaptionClass44: Text;
        txtCaptionClass45: Text;
        txtCaptionClass46: Text;
        txtCaptionClass47: Text;
        txtCaptionClass48: Text;
        txtCaptionClass49: Text;
        txtCaptionClass50: Text;
        txtCaptionClass51: Text;
        txtCaptionClass52: Text;
        txtCaptionClass53: Text;
        txtCaptionClass54: Text;
        txtCaptionClass55: Text;
        txtCaptionClass56: Text;
        txtCaptionClass57: Text;
        txtCaptionClass58: Text;
        txtCaptionClass59: Text;
        txtCaptionClass60: Text;
        txtCaptionClass61: Text;
        txtCaptionClass62: Text;
        txtCaptionClass63: Text;
        txtCaptionClass64: Text;
        txtCaptionClass65: Text;
        txtCaptionClass66: Text;
        txtCaptionClass67: Text;
        txtCaptionClass68: Text;
        txtCaptionClass69: Text;
        txtCaptionClass70: Text;
        txtCaptionClass71: Text;
        txtCaptionClass72: Text;
        txtCaptionClass73: Text;
        txtCaptionClass74: Text;
        txtCaptionClass75: Text;
        txtCaptionClass76: Text;
        txtCaptionClass77: Text;
        txtCaptionClass78: Text;
        txtCaptionClass79: Text;
        txtCaptionClass80: Text;
        txtCaptionClass81: Text;
        txtCaptionClass82: Text;
        txtCaptionClass83: Text;
        txtCaptionClass84: Text;
        txtCaptionClass85: Text;
        txtCaptionClass86: Text;
        txtCaptionClass87: Text;
        txtCaptionClass88: Text;
        txtCaptionClass89: Text;
        txtCaptionClass90: Text;
        txtCaptionClass91: Text;
        txtCaptionClass92: Text;
        FilterValue: Variant;
        DateV: Date;
        IntegerV: Integer;
        DecimalV: Decimal;
        TextV: Text;
        CodeV: Code[10];
        FieldNoAux: Integer;
        txtCreate: label 'Created new Item No.: %1 ';
        txtCharacterNo: label '"Character No." of field %1 has not a value';
        RecRefCheck: RecordRef;
        FieldRefCheck: FieldRef;
        txtCOPYSTR: label '"Description" is higher than 50 chars, the string will be cut to the 50th digit.';
        txtItemCheck: label 'The items with the inserted attributes already exists. Do you want to continue?';
        BlExit: Boolean;
        IsBOM: Boolean;
        txtCreateBOM: label 'Created new "Production BOM": %1';
        tmpItem: Record Item temporary;

    local procedure InsertCaption()
    begin
        if IsBOM then
            Gcdu50000.SetBOM(optItemType)
        else
            Gcdu50000.SetProcSystem(BlPurchase, optItemType);
        Gcdu50000.GenerateConfiguratorArray(RecTmpAux);
        Gcdu50000.SaveArray(GArray, FieldNameArray, EntryNoArray, AssignValue, ProgressiveArray, AttributeArray, OptionArray);

        RecTmpAux.Reset;
        RecTmpAux.SetRange("Description 2", Format(ItemConfSetup."field name"::"No."));
        Dim1 := RecTmpAux.Count;
        if RecTmpAux.FindSet then
            index := 0;
        for i := 1 to Dim1 do begin
            ItemConfSetup.Reset;
            index := i;
            case i of
                1:
                    begin
                        blVisible1 := true;
                        txtCaptionClass1 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                2:
                    begin
                        blVisible2 := true;
                        txtCaptionClass2 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                3:
                    begin
                        blVisible3 := true;
                        txtCaptionClass3 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                4:
                    begin
                        blVisible4 := true;
                        txtCaptionClass4 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                5:
                    begin
                        blVisible5 := true;
                        txtCaptionClass5 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                6:
                    begin
                        blVisible6 := true;
                        txtCaptionClass6 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                7:
                    begin
                        blVisible7 := true;
                        txtCaptionClass7 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                8:
                    begin
                        blVisible8 := true;
                        txtCaptionClass8 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                9:
                    begin
                        blVisible9 := true;
                        txtCaptionClass9 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                10:
                    begin
                        blVisible10 := true;
                        txtCaptionClass10 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                11:
                    begin
                        blVisible11 := true;
                        txtCaptionClass11 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                12:
                    begin
                        blVisible12 := true;
                        txtCaptionClass12 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                13:
                    begin
                        blVisible13 := true;
                        txtCaptionClass13 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                14:
                    begin
                        blVisible14 := true;
                        txtCaptionClass14 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                15:
                    begin
                        blVisible15 := true;
                        txtCaptionClass15 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                16:
                    begin
                        blVisible16 := true;
                        txtCaptionClass16 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                17:
                    begin
                        blVisible17 := true;
                        txtCaptionClass17 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                18:
                    begin
                        blVisible18 := true;
                        txtCaptionClass18 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                19:
                    begin
                        blVisible19 := true;
                        txtCaptionClass19 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                20:
                    begin
                        blVisible20 := true;
                        txtCaptionClass20 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
            end;
            RecTmpAux.Next;
        end;
        RecTmpAux.Reset;
        RecTmpAux.SetRange("Description 2", Format(ItemConfSetup."field name"::Description));
        if RecTmpAux.FindSet then
            Dim2 := RecTmpAux.Count;
        Dim2 += 20;
        for i := 21 to Dim2 do begin
            index := i;
            case i of
                21:
                    begin
                        blVisible21 := true;
                        txtCaptionClass21 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                22:
                    begin
                        blVisible22 := true;
                        txtCaptionClass22 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                23:
                    begin
                        blVisible23 := true;
                        txtCaptionClass23 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                24:
                    begin
                        blVisible24 := true;
                        txtCaptionClass24 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                25:
                    begin
                        blVisible25 := true;
                        txtCaptionClass25 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                26:
                    begin
                        blVisible26 := true;
                        txtCaptionClass26 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                27:
                    begin
                        blVisible27 := true;
                        txtCaptionClass27 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                28:
                    begin
                        blVisible28 := true;
                        txtCaptionClass28 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                29:
                    begin
                        blVisible29 := true;
                        txtCaptionClass29 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                30:
                    begin
                        blVisible30 := true;
                        txtCaptionClass30 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                31:
                    begin
                        blVisible31 := true;
                        txtCaptionClass31 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                32:
                    begin
                        blVisible32 := true;
                        txtCaptionClass32 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                33:
                    begin
                        blVisible33 := true;
                        txtCaptionClass33 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                34:
                    begin
                        blVisible34 := true;
                        txtCaptionClass34 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                35:
                    begin
                        blVisible35 := true;
                        txtCaptionClass35 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                36:
                    begin
                        blVisible36 := true;
                        txtCaptionClass36 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                37:
                    begin
                        blVisible37 := true;
                        txtCaptionClass37 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                38:
                    begin
                        blVisible38 := true;
                        txtCaptionClass38 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                39:
                    begin
                        blVisible39 := true;
                        txtCaptionClass39 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                40:
                    begin
                        blVisible40 := true;
                        txtCaptionClass40 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                41:
                    begin
                        blVisible41 := true;
                        txtCaptionClass41 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                42:
                    begin
                        blVisible42 := true;
                        txtCaptionClass42 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                43:
                    begin
                        blVisible43 := true;
                        txtCaptionClass43 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                44:
                    begin
                        blVisible44 := true;
                        txtCaptionClass44 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                45:
                    begin
                        blVisible45 := true;
                        txtCaptionClass45 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                46:
                    begin
                        blVisible46 := true;
                        txtCaptionClass46 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                47:
                    begin
                        blVisible47 := true;
                        txtCaptionClass47 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                48:
                    begin
                        blVisible48 := true;
                        txtCaptionClass48 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                49:
                    begin
                        blVisible49 := true;
                        txtCaptionClass49 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                50:
                    begin
                        blVisible50 := true;
                        txtCaptionClass50 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                51:
                    begin
                        blVisible51 := true;
                        txtCaptionClass51 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                52:
                    begin
                        blVisible52 := true;
                        txtCaptionClass52 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                53:
                    begin
                        blVisible53 := true;
                        txtCaptionClass53 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                54:
                    begin
                        blVisible54 := true;
                        txtCaptionClass54 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                55:
                    begin
                        blVisible55 := true;
                        txtCaptionClass55 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                56:
                    begin
                        blVisible56 := true;
                        txtCaptionClass56 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                57:
                    begin
                        blVisible57 := true;
                        txtCaptionClass57 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                58:
                    begin
                        blVisible58 := true;
                        txtCaptionClass58 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                59:
                    begin
                        blVisible59 := true;
                        txtCaptionClass59 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                60:
                    begin
                        blVisible60 := true;
                        txtCaptionClass60 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                61:
                    begin
                        blVisible61 := true;
                        txtCaptionClass61 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                62:
                    begin
                        blVisible62 := true;
                        txtCaptionClass62 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                63:
                    begin
                        blVisible63 := true;
                        txtCaptionClass63 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                64:
                    begin
                        blVisible64 := true;
                        txtCaptionClass64 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                65:
                    begin
                        blVisible65 := true;
                        txtCaptionClass65 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                66:
                    begin
                        blVisible66 := true;
                        txtCaptionClass66 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                67:
                    begin
                        blVisible67 := true;
                        txtCaptionClass67 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                68:
                    begin
                        blVisible68 := true;
                        txtCaptionClass68 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                69:
                    begin
                        blVisible69 := true;
                        txtCaptionClass69 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                70:
                    begin
                        blVisible70 := true;
                        txtCaptionClass70 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                71:
                    begin
                        blVisible71 := true;
                        txtCaptionClass71 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
            end;
            RecTmpAux.Next;
        end;

        RecTmpAux.Reset;
        RecTmpAux.SetRange("Description 2", Format(ItemConfSetup."field name"::Value));
        if RecTmpAux.FindSet then
            Dim3 := RecTmpAux.Count;
        Dim3 += 71;
        for i := 72 to Dim3 do begin
            index := i;
            case i of
                72:
                    begin
                        blVisible72 := true;
                        txtCaptionClass72 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                73:
                    begin
                        blVisible73 := true;
                        txtCaptionClass73 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                74:
                    begin
                        blVisible74 := true;
                        txtCaptionClass74 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                75:
                    begin
                        blVisible75 := true;
                        txtCaptionClass75 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                76:
                    begin
                        blVisible76 := true;
                        txtCaptionClass76 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                77:
                    begin
                        blVisible77 := true;
                        txtCaptionClass77 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                78:
                    begin
                        blVisible78 := true;
                        txtCaptionClass78 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                79:
                    begin
                        blVisible79 := true;
                        txtCaptionClass79 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                80:
                    begin
                        blVisible80 := true;
                        txtCaptionClass80 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                81:
                    begin
                        blVisible81 := true;
                        txtCaptionClass81 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                82:
                    begin
                        blVisible82 := true;
                        txtCaptionClass82 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                83:
                    begin
                        blVisible83 := true;
                        txtCaptionClass83 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                84:
                    begin
                        blVisible84 := true;
                        txtCaptionClass84 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                85:
                    begin
                        blVisible85 := true;
                        txtCaptionClass85 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                86:
                    begin
                        blVisible86 := true;
                        txtCaptionClass86 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                87:
                    begin
                        blVisible87 := true;
                        txtCaptionClass87 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                88:
                    begin
                        blVisible88 := true;
                        txtCaptionClass88 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                89:
                    begin
                        blVisible89 := true;
                        txtCaptionClass89 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                90:
                    begin
                        blVisible90 := true;
                        txtCaptionClass90 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                91:
                    begin
                        blVisible91 := true;
                        txtCaptionClass91 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
                92:
                    begin
                        blVisible92 := true;
                        txtCaptionClass92 := RecTmpAux.Description;
                        TableNoAndFieldNoConfig;
                    end;
            end;
            RecTmpAux.Next;
        end;
    end;

    local procedure SetEditableProperty(EditableProperty: Boolean; CaptionField: Text; Index: Integer; FieldNo: Integer; Attribute: Boolean)
    begin
        if not EditableProperty then
            exit;

        if (CaptionField = txtCaptionClass2) AND (FieldNo = GArray[2]) AND (Attribute = AttributeArray[2]) AND (2 > Index) then
            BlEditable2 := FALSE;
        if (CaptionField = txtCaptionClass3) AND (FieldNo = GArray[3]) AND (Attribute = AttributeArray[3]) AND (3 > Index) then
            BlEditable3 := FALSE;
        if (CaptionField = txtCaptionClass4) AND (FieldNo = GArray[4]) AND (Attribute = AttributeArray[4]) AND (4 > Index) then
            BlEditable4 := FALSE;
        if (CaptionField = txtCaptionClass5) AND (FieldNo = GArray[5]) AND (Attribute = AttributeArray[5]) AND (5 > Index) then
            BlEditable5 := FALSE;
        if (CaptionField = txtCaptionClass6) AND (FieldNo = GArray[6]) AND (Attribute = AttributeArray[6]) AND (6 > Index) then
            BlEditable6 := FALSE;
        if (CaptionField = txtCaptionClass7) AND (FieldNo = GArray[7]) AND (Attribute = AttributeArray[7]) AND (7 > Index) then
            BlEditable7 := FALSE;
        if (CaptionField = txtCaptionClass8) AND (FieldNo = GArray[8]) AND (Attribute = AttributeArray[8]) AND (8 > Index) then
            BlEditable8 := FALSE;
        if (CaptionField = txtCaptionClass9) AND (FieldNo = GArray[9]) AND (Attribute = AttributeArray[9]) AND (9 > Index) then
            BlEditable9 := FALSE;
        if (CaptionField = txtCaptionClass10) AND (FieldNo = GArray[10]) AND (Attribute = AttributeArray[10]) AND (10 > Index) then
            BlEditable10 := FALSE;
        if (CaptionField = txtCaptionClass11) AND (FieldNo = GArray[11]) AND (Attribute = AttributeArray[11]) AND (11 > Index) then
            BlEditable11 := FALSE;
        if (CaptionField = txtCaptionClass12) AND (FieldNo = GArray[12]) AND (Attribute = AttributeArray[12]) AND (12 > Index) then
            BlEditable12 := FALSE;
        if (CaptionField = txtCaptionClass13) AND (FieldNo = GArray[13]) AND (Attribute = AttributeArray[13]) AND (13 > Index) then
            BlEditable13 := FALSE;
        if (CaptionField = txtCaptionClass14) AND (FieldNo = GArray[14]) AND (Attribute = AttributeArray[14]) AND (14 > Index) then
            BlEditable14 := FALSE;
        if (CaptionField = txtCaptionClass15) AND (FieldNo = GArray[15]) AND (Attribute = AttributeArray[15]) AND (15 > Index) then
            BlEditable15 := FALSE;
        if (CaptionField = txtCaptionClass16) AND (FieldNo = GArray[16]) AND (Attribute = AttributeArray[16]) AND (16 > Index) then
            BlEditable16 := FALSE;
        if (CaptionField = txtCaptionClass17) AND (FieldNo = GArray[17]) AND (Attribute = AttributeArray[17]) AND (17 > Index) then
            BlEditable17 := FALSE;
        if (CaptionField = txtCaptionClass18) AND (FieldNo = GArray[18]) AND (Attribute = AttributeArray[18]) AND (18 > Index) then
            BlEditable18 := FALSE;
        if (CaptionField = txtCaptionClass19) AND (FieldNo = GArray[19]) AND (Attribute = AttributeArray[19]) AND (19 > Index) then
            BlEditable19 := FALSE;
        if (CaptionField = txtCaptionClass20) AND (FieldNo = GArray[20]) AND (Attribute = AttributeArray[20]) AND (20 > Index) then
            BlEditable20 := FALSE;
    end;

    local procedure SetNextField(CaptionField: Text; var ValueField: Code[30]; FieldNo: Integer; Attribute: Boolean)
    begin
        if (CaptionField = txtCaptionClass2) AND (FieldNo = GArray[2]) AND (Attribute = AttributeArray[2]) then
            Vars[2] := ValueField;
        if (CaptionField = txtCaptionClass3) AND (FieldNo = GArray[3]) AND (Attribute = AttributeArray[3]) then
            Vars[3] := ValueField;
        if (CaptionField = txtCaptionClass4) AND (FieldNo = GArray[4]) AND (Attribute = AttributeArray[4]) then
            Vars[4] := ValueField;
        if (CaptionField = txtCaptionClass5) AND (FieldNo = GArray[5]) AND (Attribute = AttributeArray[5]) then
            Vars[5] := ValueField;
        if (CaptionField = txtCaptionClass6) AND (FieldNo = GArray[6]) AND (Attribute = AttributeArray[6]) then
            Vars[6] := ValueField;
        if (CaptionField = txtCaptionClass7) AND (FieldNo = GArray[7]) AND (Attribute = AttributeArray[7]) then
            Vars[7] := ValueField;
        if (CaptionField = txtCaptionClass8) AND (FieldNo = GArray[8]) AND (Attribute = AttributeArray[8]) then
            Vars[8] := ValueField;
        if (CaptionField = txtCaptionClass9) AND (FieldNo = GArray[9]) AND (Attribute = AttributeArray[9]) then
            Vars[9] := ValueField;
        if (CaptionField = txtCaptionClass10) AND (FieldNo = GArray[10]) AND (Attribute = AttributeArray[10]) then
            Vars[10] := ValueField;
        if (CaptionField = txtCaptionClass11) AND (FieldNo = GArray[11]) AND (Attribute = AttributeArray[11]) then
            Vars[11] := ValueField;
        if (CaptionField = txtCaptionClass12) AND (FieldNo = GArray[12]) AND (Attribute = AttributeArray[12]) then
            Vars[12] := ValueField;
        if (CaptionField = txtCaptionClass13) AND (FieldNo = GArray[13]) AND (Attribute = AttributeArray[13]) then
            Vars[13] := ValueField;
        if (CaptionField = txtCaptionClass14) AND (FieldNo = GArray[14]) AND (Attribute = AttributeArray[14]) then
            Vars[14] := ValueField;
        if (CaptionField = txtCaptionClass15) AND (FieldNo = GArray[15]) AND (Attribute = AttributeArray[15]) then
            Vars[15] := ValueField;
        if (CaptionField = txtCaptionClass16) AND (FieldNo = GArray[16]) AND (Attribute = AttributeArray[16]) then
            Vars[16] := ValueField;
        if (CaptionField = txtCaptionClass17) AND (FieldNo = GArray[17]) AND (Attribute = AttributeArray[17]) then
            Vars[17] := ValueField;
        if (CaptionField = txtCaptionClass18) AND (FieldNo = GArray[18]) AND (Attribute = AttributeArray[18]) then
            Vars[18] := ValueField;
        if (CaptionField = txtCaptionClass19) AND (FieldNo = GArray[19]) AND (Attribute = AttributeArray[19]) then
            Vars[19] := ValueField;
        if (CaptionField = txtCaptionClass20) AND (FieldNo = GArray[20]) AND (Attribute = AttributeArray[20]) then
            Vars[20] := ValueField;
    end;

    local procedure GenerateCode(i: Integer)
    var
        ItemAttribute: Record "Item Attribute";
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        tmpItem2: Record Item temporary;
    begin
        rcField.Reset;

        if IsBOM then
            ItemConfSetup.SetRange("Procurement System", ItemConfSetup."procurement system"::"Production BOM")
        else
            ItemConfSetup.SetRange("Procurement System", optProcSyst);
        ItemConfSetup.SetRange("Item Type", optItemType);
        Int := GArray[i];
        ItemConfSetup.SetRange(ItemConfSetup."Field No.", Int);
        ItemConfSetup.SetRange(ItemConfSetup."Entry No.", EntryNoArray[i]);
        if ItemConfSetup.FindSet then
            OrderNoArray[i] := ItemConfSetup."Character No.";
        CharacterNoArray[i] := ItemConfSetup."Field Character No.";
        if (CharacterNoArray[i] = 0) then
            Error(txtCharacterNo, FieldNameArray[i])
        else
            CodeGenerationArray[i] := CopyStr(Vars[i], CharacterNoArray[i], 1);

        case ItemConfSetup."Field Type" of
            ItemConfSetup."Field Type"::Field:
                begin
                    if not ItemConfSetup.Progressive then begin
                        FieldRefCheck := RecRefCheck.Field(GArray[i]);
                        if OptionArray[i] then begin
                            FieldRefCheck.SetRange(Selected[i]);
                        end
                        else
                            FieldRefCheck.SetRange(Vars[i]);
                    end;
                end;
            ItemConfSetup."Field Type"::Attribute:
                begin
                    ItemAttribute.get(GArray[i]);
                    ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
                    ItemAttributeValueMapping.SetRange("Item Attribute ID", ItemAttribute.ID);
                    ItemAttributeValueMapping.SetRange("Item Attribute Value ID", AttributeArrayID[i]);
                    if ItemAttributeValueMapping.FindSet() then
                        repeat
                            if i = 1 then begin
                                if not tmpItem.get(ItemAttributeValueMapping."No.") then begin
                                    tmpItem."No." := ItemAttributeValueMapping."No.";
                                    tmpItem."Allow Invoice Disc." := FALSE;
                                    tmpItem.Insert();
                                end
                            end
                            else begin
                                if tmpItem.get(ItemAttributeValueMapping."No.") then begin
                                    tmpItem."Allow Invoice Disc." := FALSE;
                                    tmpItem.Modify();

                                    tmpItem2."No." := ItemAttributeValueMapping."No.";
                                    tmpItem2.Insert();
                                end
                                else begin
                                    tmpItem.reset;
                                    if tmpItem.FindSet() then
                                        repeat
                                            if not tmpItem2.get(tmpItem."No.") then
                                                tmpItem."Allow Invoice Disc." := true;
                                        until tmpItem.next = 0;
                                end;
                            end;
                        until ItemAttributeValueMapping.next = 0;

                    tmpItem.SetRange("Allow Invoice Disc.", true);
                    tmpItem.DeleteAll(false);

                    tmpItem.reset;
                end;
        end;
    end;

    local procedure GenerateDescription(i: Integer)
    begin
        rcField.Reset;
        j += 1;

        if IsBOM then
            ItemConfSetup.SetRange("Procurement System", ItemConfSetup."procurement system"::"Production BOM")
        else
            ItemConfSetup.SetRange("Procurement System", optProcSyst);
        ItemConfSetup.SetRange("Item Type", optItemType);
        DescriptionGenerationArray[j] := Vars[j];
    end;

    local procedure Entry(PintEntry: Integer; PtexEntries: Text; PtexSeperator: Text[1]) PtexReturnValue: Text
    var
        Lint: Integer;
        LintLength: Integer;
    begin
        PtexReturnValue := '';
        LintLength := STRLEN(PtexEntries);

        IF (LintLength = 0) OR
           (PintEntry <= 0) THEN
            EXIT('');

        IF PtexSeperator = '' THEN
            PtexSeperator := ',';

        Lint := 0;
        WHILE Lint < LintLength DO BEGIN
            Lint := Lint + 1;
            IF COPYSTR(PtexEntries, Lint, 1) = PtexSeperator THEN
                PintEntry := PintEntry - 1
            ELSE
                IF PintEntry = 1 THEN
                    PtexReturnValue := PtexReturnValue + COPYSTR(PtexEntries, Lint, 1);
        END;
        EXIT(PtexReturnValue)
    end;

    local procedure LookUpConfig(Pi: Integer): Code[30]
    var
        ItemAttributeValue: Record "Item Attribute Value";
        ItemAttributeValues: page "Item Attribute Values";
        ItemConfSetup2: Record "CFG Item Configurator Code";
        ItemRecref: RecordRef;
        MyFieldRef: FieldRef;
        OptionCaption: text;
        ExitCode: code[30];
    begin
        if OptionArray[pi] then begin
            ItemConfSetup2.SetRange("Field No.", GArray[pi]);
            ItemConfSetup2.SetRange("Entry No.", EntryNoArray[pi]);
            ItemConfSetup2.FindFirst;

            ItemRecref.OPEN(ItemConfSetup2."Table No.");
            MyFieldRef := ItemRecref.FIELD(GArray[Pi]);
            OptionCaption := MyFieldRef.OPTIONCAPTION;
            Selected[Pi] := StrMenu(OptionCaption);
            ExitCode := Entry(Selected[Pi], OptionCaption, ',');
            if Selected[Pi] > 0 then
                Selected[Pi] -= 1;
            exit(ExitCode);
        end;

        if AttributeArray[Pi] then begin
            ItemAttributeValue.SetRange("Attribute ID", GArray[Pi]);
            ItemAttributeValues.SetTableView(ItemAttributeValue);
            ItemAttributeValues.LookupMode(true);
            if ItemAttributeValues.RunModal() = Action::LookupOK then begin
                ItemAttributeValues.GetRecord(ItemAttributeValue);
                AttributeArrayID[Pi] := ItemAttributeValue.id;

                exit(ItemAttributeValue.GetValueInCurrentLanguage)
            end;

            exit;
        end;

        Clear(FRef);
        Bl := false;

        RRef.Close;
        RRef.Open(tabletmp[Pi]);

        repeat
            RcLookupConf.CalcFields(Condition);
            if (RcLookupConf.Condition) then begin
                RcCondition.Reset;
                RcCondition.SetRange("Table No.", RcLookupConf."Table No.");
                RcCondition.SetRange("Field No.", GArray[Pi]);
                RcCondition.SetRange("Entry No.", RcLookupConf."Entry No.");
                if RcCondition.FindSet then begin

                    case RcCondition."Filter Type" of
                        RcCondition."filter type"::CONST:
                            begin
                                for i := 1 to 92 do begin
                                    if (RcCondition."Filter Field No." = GArray[i]) then begin
                                        j := i;
                                        i := 92;
                                    end;
                                end;
                                if (Format(Vars[j]) = Format(RcCondition."Filter Value")) then begin
                                    Bl := true;
                                    RRef.Close;
                                    RRef.Open(RcLookupConf."Table Relation No.");
                                end;
                            end;

                        RcCondition."filter type"::FILTER:
                            begin
                                for i := 1 to 92 do begin
                                    if (RcCondition."Filter Field No." = GArray[i]) then begin
                                        j := i;
                                        i := 92;
                                    end;
                                end;
                                RcTemp.Reset;
                                RcTemp.Init;
                                RcTemp."E-Mail" := Vars[j];

                                if not RcTemp.Insert then
                                    RcTemp.Modify;

                                RcTemp.Reset;
                                RcTemp.FindFirst;
                                RcTemp.SetFilter("E-Mail", RcCondition."Filter Value");
                                if RcTemp.FindSet then begin
                                    Bl := true;
                                    RRef.Close;
                                    RRef.Open(RcLookupConf."Table Relation No.");
                                end;
                            end;
                    end;
                end;
            end;
        until (RcLookupConf.Next = 0) or (Bl = true);


        RcRelFilters.SetRange("Table No.", RcLookupConf."Table No.");
        RcRelFilters.SetRange("Field No.", GArray[Pi]);
        RcRelFilters.SetRange("Entry No.", EntryNoArray[Pi]);
        if RcRelFilters.FindSet then begin
            repeat
                FieldNoAux := RcRelFilters."Filter Field No.";
                FRef := RRef.Field(FieldNoAux);
                case RcRelFilters."Filter Type" of
                    RcRelFilters."filter type"::FILTER:
                        begin
                            FRef.SetFilter(RcRelFilters."Filter Value")
                        end;
                    RcRelFilters."filter type"::CONST:
                        begin
                            FilterValue := FRef.Value;
                            VariantFormat;
                        end;
                    RcRelFilters."filter type"::Field:
                        begin
                            repeat
                                i += 1;
                                FoundBoolean := false;
                                if GArray[i] = RcRelFilters."Filter Field No." then
                                    FoundBoolean := true;
                            until FoundBoolean = true;
                            FRef.SetRange(Vars[i]);
                        end;
                end;
            until RcRelFilters.Next = 0;
        end;

        VarRecRef := RRef;
        if Page.RunModal(0, VarRecRef) = Action::LookupOK then begin
            RRef := VarRecRef;
            if (fieldtmp[Pi] <> 0) then
                FRef := RRef.Field(fieldtmp[Pi])
            else
                FRef := RRef.FieldIndex(1);
            exit(FRef.Value);
        end;
        exit('');

        RRef.Close;

    end;

    local procedure TableNoAndFieldNoConfig()
    begin
        if AttributeArray[i] then begin
            fieldtmp[i] := 0;
            exit
        end;

        ItemConfSetup.SetRange("Field No.", GArray[i]);
        ItemConfSetup.SetRange("Entry No.", EntryNoArray[i]);
        if ItemConfSetup.FindFirst then begin
            if (ItemConfSetup."Table No. Relation" = 0) then begin
                RcLookupConf.SetRange("Table No.", ItemConfSetup."Table No.");
                RcLookupConf.SetRange("Field No.", ItemConfSetup."Field No.");
                RcLookupConf.SetRange("Entry No.", ItemConfSetup."Entry No.");
                if RcLookupConf.FindSet then
                    tabletmp[i] := RcLookupConf."Table Relation No."
            end else begin
                tabletmp[i] := ItemConfSetup."Table No. Relation"
            end;

            if (ItemConfSetup."Table No. Relation" = 0) then begin
                RcLookupConf.SetRange("Table No.", ItemConfSetup."Table No.");
                RcLookupConf.SetRange("Field No.", ItemConfSetup."Field No.");
                RcLookupConf.SetRange("Entry No.", ItemConfSetup."Entry No.");
                if RcLookupConf.FindSet then
                    fieldtmp[i] := RcLookupConf."Field Relation No.";
            end else begin
                fieldtmp[i] := ItemConfSetup."Field No. Relation";
            end;
            ItemConfSetup.SetRange("Field No.");
        end;

    end;

    local procedure VariantFormat()
    begin
        if FilterValue.IsDate then begin
            if Evaluate(DateV, RcRelFilters."Filter Value") then;
            FRef.SetRange(DateV);
        end;
        if FilterValue.Isinteger then begin
            if Evaluate(IntegerV, RcRelFilters."Filter Value") then
                FRef.SetRange(IntegerV);
        end;
        if FilterValue.IsDecimal then begin
            if Evaluate(DecimalV, RcRelFilters."Filter Value") then
                FRef.SetRange(DecimalV);
        end;
        if FilterValue.IsText then begin
            TextV := RcRelFilters."Filter Value";
            FRef.SetRange(TextV);
        end;
        if FilterValue.ISCODE then begin
            CodeV := RcRelFilters."Filter Value";
            FRef.SetRange(CodeV);
        end;
    end;

    local procedure AssignValueFromLookup()
    begin
    end;

    procedure SetProcSystem(IBoolean: Boolean; IoptItemType: Integer)
    begin
        BlPurchase := IBoolean;
        optItemType := IoptItemType;
    end;

    procedure AssistEdit(Iindex: Integer; BlPurch: Boolean): Boolean
    var
        SalesHeader2: Record "Sales Header";
    begin
        Setup.Get;
        if BlPurch then
            TxNrSeries := Setup."Purchase Serial No."
        else
            TxNrSeries := Setup."Prod. Order Serial No.";

        if IsBOM then
            TxNrSeries := Setup."Prod. BOM Serial No.";

        Evaluate(Code, TxNrSeries);
        if NoSeriesMgt.SelectSeries(TxNrSeries, '', Code) then begin
            NoSeriesMgt.SetSeries(NrSeries);
            Vars[Iindex] := CopyStr(NrSeries, 1, 1);
            Vars[Iindex + 1] := CopyStr(NrSeries, 2, 1);
            Vars[Iindex + 2] := CopyStr(NrSeries, 3, 1);
            Vars[Iindex + 3] := CopyStr(NrSeries, 4, 1);
            Vars[Iindex + 4] := CopyStr(NrSeries, 5, 1);

            exit(true);
        end;
    end;

    procedure IsProductionBOM(IoptItemType: Integer)
    begin
        IsBOM := true;
        optItemType := IoptItemType;
    end;
}

