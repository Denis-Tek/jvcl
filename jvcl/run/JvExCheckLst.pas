{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExCheckLst.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}

unit JvExCheckLst;
interface
uses
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, CheckLst,
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  Qt, QGraphics, QControls, QForms, QCheckLst, Types, QWindows,
  {$ENDIF VisualCLX}
  Classes, SysUtils,
  JvTypes, JvThemes, JVCLVer, JvExControls;

{$IFDEF VCL}
 {$DEFINE NeedMouseEnterLeave}
{$ENDIF VCL}
{$IFDEF VisualCLX}
 {$IF not declared(PatchedVCLX)}
  {$DEFINE NeedMouseEnterLeave}
 {$IFEND}
{$ENDIF VisualCLX}

type
  TJvExCheckListBox = class(TCheckListBox, IJvWinControlEvents, IJvControlEvents, IPerformControl)
  {$IFDEF VCL}
  protected
   // IJvControlEvents
    procedure VisibleChanged; dynamic;
    procedure EnabledChanged; dynamic;
    procedure TextChanged; dynamic;
    procedure FontChanged; dynamic;
    procedure ColorChanged; dynamic;
    procedure ParentFontChanged; dynamic;
    procedure ParentColorChanged; dynamic;
    procedure ParentShowHintChanged; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; dynamic;
    function HitTest(X, Y: Integer): Boolean; dynamic;
    procedure MouseEnter(Control: TControl); dynamic;
    procedure MouseLeave(Control: TControl); dynamic;
    {$IFNDEF HASAUTOSIZE}
     {$IFNDEF COMPILER6_UP}
    procedure SetAutoSize(Value: Boolean); virtual;
     {$ENDIF !COMPILER6_UP}
    {$ENDIF !HASAUTOSIZE}
  public
    procedure Dispatch(var Msg); override;
  protected
   // IJvWinControlEvents
    procedure CursorChanged; dynamic;
    procedure ShowingChanged; dynamic;
    procedure ShowHintChanged; dynamic;
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); dynamic;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
  public
    function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
  protected
    WindowProc: TClxWindowProc;
    procedure WndProc(var Msg: TMessage); virtual;
    procedure MouseEnter(Control: TControl); override;
    procedure MouseLeave(Control: TControl); override;
    procedure ParentColorChanged; override;
  protected
    procedure BoundsChanged; override;
    function NeedKey(Key: Integer; Shift: TShiftState;
      const KeyText: WideString): Boolean; override;
    procedure Painting(Sender: QObjectH; EventRegion: QRegionH); override;
  {$ENDIF VisualCLX}
  private
    FHintColor: TColor;
    FSavedHintColor: TColor;
    FMouseOver: Boolean;
    FOnParentColorChanged: TNotifyEvent;
  {$IFDEF NeedMouseEnterLeave}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
  protected
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  {$ENDIF NeedMouseEnterLeave}
  protected
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure DoFocusChanged(Control: TWinControl); dynamic;
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clInfoBk;
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  private
  {$IFDEF VCL}
    FAboutJVCL: TJVCLAboutInfo;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  {$ENDIF VCL}
  {$IFDEF VisualCLX}
    FAboutJVCLX: TJVCLAboutInfo;
  published
    property AboutJVCLX: TJVCLAboutInfo read FAboutJVCLX write FAboutJVCLX stored False;
  {$ENDIF VisuaLCLX}
  protected
    procedure DoGetDlgCode(var Code: TDlgCodes); virtual;
    procedure DoSetFocus(FocusedWnd: HWND); dynamic;
    procedure DoKillFocus(FocusedWnd: HWND); dynamic;
    procedure DoBoundsChanged; dynamic;
    function DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF VisualCLX}
  private
    FCanvas: TCanvas;
  protected
    procedure Paint; virtual;
    property Canvas: TCanvas read FCanvas;
  {$ENDIF VisualCLX}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  TJvExPubCheckListBox = class(TJvExCheckListBox)
  {$IFDEF VCL}
  published
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
  {$ENDIF VCL}
  end;
  

implementation

{$IFDEF VCL}
procedure TJvExCheckListBox.Dispatch(var Msg);
asm
    JMP   DispatchMsg
end;

procedure TJvExCheckListBox.VisibleChanged;
asm
    MOV  EDX, CM_VISIBLECHANGED 
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.EnabledChanged;
asm
    MOV  EDX, CM_ENABLEDCHANGED 
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.TextChanged;
asm
    MOV  EDX, CM_TEXTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.FontChanged;
asm
    MOV  EDX, CM_FONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ColorChanged;
asm
    MOV  EDX, CM_COLORCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ParentFontChanged;
asm
    MOV  EDX, CM_PARENTFONTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ParentShowHintChanged;
asm
    MOV  EDX, CM_PARENTSHOWHINTCHANGED
    JMP  InheritMsg
end;

function TJvExCheckListBox.WantKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := InheritMsgEx(Self, CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCheckListBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HINTSHOW, 0, Integer(@HintInfo)) <> 0;
end;

function TJvExCheckListBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := InheritMsgEx(Self, CM_HITTEST, 0, Integer(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

procedure TJvExCheckListBox.MouseEnter(Control: TControl);
begin
  if (not FMouseOver) and not (csDesigning in ComponentState) then
  begin
    FMouseOver := True;
    FSavedHintColor := Application.HintColor;
    if FHintColor <> clNone then
      Application.HintColor := FHintColor;
  end;
  InheritMsgEx(Self, CM_MOUSEENTER, 0, Integer(Control));
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TJvExCheckListBox.MouseLeave(Control: TControl);
begin
  if FMouseOver then
  begin
    FMouseOver := False;
    Application.HintColor := FSavedHintColor;
  end;
  InheritMsgEx(Self, CM_MOUSELEAVE, 0, Integer(Control));
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

procedure TJvExCheckListBox.ParentColorChanged;
begin
  InheritMsg(Self, CM_PARENTCOLORCHANGED);
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

{$IFNDEF HASAUTOSIZE}
 {$IFNDEF COMPILER6_UP}
procedure TJvExCheckListBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;
 {$ENDIF !COMPILER6_UP}
{$ENDIF !HASAUTOSIZE}
procedure TJvExCheckListBox.CursorChanged;
asm
    MOV  EDX, CM_CURSORCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ShowHintChanged;
asm
    MOV  EDX, CM_SHOWHINTCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ShowingChanged;
asm
    MOV  EDX, CM_SHOWINGCHANGED
    JMP  InheritMsg
end;

procedure TJvExCheckListBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanging
end;

procedure TJvExCheckListBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
asm
    JMP   Control_ControlsListChanged
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCheckListBox.GetParentBackground: Boolean;
asm
    JMP   JvThemes.GetParentBackground
end;

procedure TJvExCheckListBox.SetParentBackground(Value: Boolean);
asm
    JMP   JvThemes.SetParentBackground
end;
{$ENDIF JVCLThemesEnabledD56}
{$ENDIF VCL}
{$IFDEF VisualCLX}
procedure TJvExCheckListBox.MouseEnter(Control: TControl);
begin
  if (not FMouseOver) and not (csDesigning in ComponentState) then
  begin
    FMouseOver := True;
    FSavedHintColor := Application.HintColor;
    if FHintColor <> clNone then
      Application.HintColor := FHintColor;
  end;
  inherited MouseEnter(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$IFEND}
end;

procedure TJvExCheckListBox.MouseLeave(Control: TControl);
begin
  if FMouseOver then
  begin
    FMouseOver := False;
    Application.HintColor := FSavedHintColor;
  end;
  inherited MouseLeave(Control);
  {$IF not declared(PatchedVCLX)}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$IFEND}
end;

procedure TJvExCheckListBox.ParentColorChanged;
begin
  inherited ParentColorChanged;
  if Assigned(FOnParentColorChanged) then
    FOnParentColorChanged(Self);
end;

function TJvExCheckListBox.Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;
var
  Mesg: TMessage;
begin
  Mesg.Result := 0;
  if Self <> nil then
  begin
    Mesg.Msg := Msg;
    Mesg.WParam := WParam;
    Mesg.LParam := LParam;
    WindowProc(Mesg);
  end;
  Result := Mesg.Result;
end;

procedure TJvExCheckListBox.WndProc(var Msg: TMessage);
begin
  Dispatch(Msg);
end;
procedure TJvExCheckListBox.Painting(Sender: QObjectH; EventRegion: QRegionH);
begin
  if WidgetControl_Painting(Self, Canvas, EventRegion) <> nil then
  begin // returns an interface
    DoPaintBackground(Canvas, 0);
    Paint;
  end;
end;

function TJvExCheckListBox.NeedKey(Key: Integer; Shift: TShiftState;
  const KeyText: WideString): Boolean;
begin
  Result := TWidgetControl_NeedKey(Self, Key, Shift, KeyText,
    inherited NeedKey(Key, Shift, KeyText));
end;

procedure TJvExCheckListBox.BoundsChanged;
begin
  inherited BoundsChanged;
  DoBoundsChanged;
end;
{$ENDIF VisualCLX}
procedure TJvExCheckListBox.CMFocusChanged(var Msg: TCMFocusChanged);
begin
  inherited;
  DoFocusChanged(Msg.Sender);
end;

procedure TJvExCheckListBox.DoFocusChanged(Control: TWinControl);
begin
end;
procedure TJvExCheckListBox.DoBoundsChanged;
begin
end;

procedure TJvExCheckListBox.DoGetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCheckListBox.DoSetFocus(FocusedWnd: HWND);
begin
end;

procedure TJvExCheckListBox.DoKillFocus(FocusedWnd: HWND);
begin
end;

function TJvExCheckListBox.DoPaintBackground(Canvas: TCanvas; Param: Integer): Boolean;
asm
  JMP   JvExDoPaintBackground
end;
{$IFDEF VCL}
constructor TJvExCheckListBox.Create(AOwner: TComponent);
begin
  {$IFDEF VisualCLX}
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  {$ENDIF VisualCLX}
  inherited Create(AOwner);
  FHintColor := clInfoBk;
  
end;

destructor TJvExCheckListBox.Destroy;
begin
  
  inherited Destroy;
end;
{$ENDIF VCL}
{$IFDEF VisualCLX}
constructor TJvExCheckListBox.Create(AOwner: TComponent);
begin
  WindowProc := WndProc;
  {$IF declared(PatchedVCLX) and (PatchedVCLX > 3.3)}
  SetCopyRectMode(Self, cmVCL);
  {$IFEND}
  inherited Create(AOwner);
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  
end;

destructor TJvExCheckListBox.Destroy;
begin
  
  FCanvas.Free;
  inherited Destroy;
end;

procedure TJvExCheckListBox.Paint;
begin
  WidgetControl_DefaultPaint(Self, Canvas);
end;
{$ENDIF VisualCLX}

end.
