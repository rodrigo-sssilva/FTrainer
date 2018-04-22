local changeHotkeyKeysForm
local hotkeys = {}
local userDefinedKeys = {}
local hotkeysKeysSettings

local function userPressedKey(sender, key)
  if userDefinedKeys[5]==0 then
    for i=1,5 do
      if userDefinedKeys[i]==0 then
        userDefinedKeys[i]=key
        break
      else
        if userDefinedKeys[i]==key then break end
      end
    end
  end

  changeHotkeyKeysForm.CEEdit1.Text=convertKeyComboToString(userDefinedKeys)
  return 0
end

local function clearHotkey()
  userDefinedKeys={0,0,0,0,0}
  changeHotkeyKeysForm.CEEdit1.Text=convertKeyComboToString(userDefinedKeys)
  changeHotkeyKeysForm.CEEdit1.setFocus()
end

local function formCreate()
  changeHotkeyKeysForm=createForm(false)
  changeHotkeyKeysForm.Name = 'changeHotkeyKeysForm'
  changeHotkeyKeysForm.Caption = 'Change Hotkey Keys'
  changeHotkeyKeysForm.Width = 300
  changeHotkeyKeysForm.Height = 120
  changeHotkeyKeysForm.Position = poScreenCenter
  changeHotkeyKeysForm.OnClose =
     function ()
       changeHotkeyKeysForm.CEEdit1.setFocus()
       return caHide
     end

  local CELabel1=createLabel(changeHotkeyKeysForm)
  CELabel1.Name = 'CELabel1'
  CELabel1.Left = 20
  CELabel1.Top = 20
  CELabel1.Caption = 'Set hotkey:'

  local CEEdit1=createEdit(changeHotkeyKeysForm)
  CEEdit1.Name = 'CEEdit1'
  CEEdit1.Text = ''
  CEEdit1.AnchorSideLeft.Control = CELabel1
  CEEdit1.AnchorSideTop.Control = CELabel1
  CEEdit1.AnchorSideTop.Side = asrBottom
  CEEdit1.Height = 25
  CEEdit1.Width = 248
  CEEdit1.BorderSpacing.Top = 4

  local clearButton=createButton(changeHotkeyKeysForm)
  clearButton.Name = 'clearButton'
  clearButton.AnchorSideLeft.Control = CEEdit1
  clearButton.AnchorSideTop.Control = CEEdit1
  clearButton.AnchorSideTop.Side = asrBottom
  clearButton.Height = 30
  clearButton.Width = 80
  clearButton.BorderSpacing.Top = 8
  clearButton.Caption = 'Clear'

  local applyButton=createButton(changeHotkeyKeysForm)
  applyButton.Name = 'applyButton'
  applyButton.AnchorSideLeft.Control = clearButton
  applyButton.AnchorSideLeft.Side = asrBottom
  applyButton.AnchorSideTop.Control = clearButton
  applyButton.Height = 30
  applyButton.Width = 80
  applyButton.BorderSpacing.Left = 10
  applyButton.Caption = 'Apply'

  CEEdit1.OnKeyDown = userPressedKey
  local mbtn={false,true,true,true}
  CEEdit1.OnMouseDown = function (s,k) if mbtn[k] then s.OnKeyDown(s,k+2) end end
  clearButton.OnClick = clearHotkey    -- clear button
  applyButton.ModalResult = mrYes      -- apply button
end

local function updateControlWithHotkeyString(ctrl,hotkey)
  local hotkeyString
  if hotkey.ClassName=='TMemoryRecordHotkey' then
    hotkeyString = convertKeyComboToString(hotkey.Keys)
  else
    hotkeyString = convertKeyComboToString{hotkey.getKeys()}
  end

  if ctrl.ClassName=='tcheat' then
    ctrl.Hotkey = hotkeyString
  else -- not a tcheat component
    if ctrl.Text then
      ctrl.Text = hotkeyString
    elseif ctrl.Caption then
      ctrl.Caption = hotkeyString
    end
  end
end

local function getHotkeyFromRegistry(hotkeyName,hotkey)
  local str = hotkeysKeysSettings.Value[hotkeyName]
  if str=='' then return end
  local keys={0,0,0,0,0}
  local i=1
  for v in str:gmatch'[^,]+' do
    keys[i] = tonumber(v)
    i=i+1
  end
  if hotkey.ClassName=='TMemoryRecordHotkey' then
    hotkey.Keys = keys
  else
    hotkey.setKeys(keys[1],keys[2],keys[3],keys[4],keys[5])
  end
end

local function setHotkeyInRegistry(hotkeyName,hotkey)
  if hotkey.ClassName=='TMemoryRecordHotkey' then
    hotkeysKeysSettings.Value[hotkeyName] = table.concat(hotkey.Keys,',')
  else
    hotkeysKeysSettings.Value[hotkeyName] = table.concat({hotkey.getKeys()},',')
  end
end

local function createUniqueHotkeyName(hotkey,index)
  local name = ''..index
  if hotkey.ClassName=='TMemoryRecordHotkey' then
    name = name..'_'..hotkey.Owner.Description..'_'..hotkey.Description..'_'..
                      hotkey.Owner.ID..'_'..hotkey.ID
  end
  return name
end


function changeHotkeyKeys(hotkey,ctrl)
  if not changeHotkeyKeysFormCreated then
    changeHotkeyKeysFormCreated = true
    formCreate()
  end

  if hotkey==nil then return end

  userDefinedKeys={0,0,0,0,0}

  local changed = false

  if hotkey.ClassName=='TGenericHotkey' then
    for i,v in ipairs({hotkey.getKeys()}) do
      userDefinedKeys[i]=v
    end
    changeHotkeyKeysForm.CEEdit1.Text=convertKeyComboToString(userDefinedKeys)
    if changeHotkeyKeysForm.showModal()==mrYes then
      hotkey.setKeys(userDefinedKeys[1],userDefinedKeys[2],
                     userDefinedKeys[3],userDefinedKeys[4],
                     userDefinedKeys[5])
      changed = true
    end

  elseif hotkey.ClassName=='TMemoryRecordHotkey' then
    for i,v in ipairs(hotkey.Keys) do
      userDefinedKeys[i]=v
    end
    changeHotkeyKeysForm.CEEdit1.Text=convertKeyComboToString(userDefinedKeys)
    if changeHotkeyKeysForm.showModal()==mrYes then
      hotkey.Keys = userDefinedKeys
      changed = true
    end
  end

  if changed and (ctrl~=nil) then
   updateControlWithHotkeyString(ctrl,hotkey)
  end
end

function addChangeHotkeyKeysFunctionality(ctrl, hotkey)
  if not ( inheritsFromControl(ctrl) and
           inheritsFromObject(hotkey) and
           ( hotkey.ClassName=='TMemoryRecordHotkey' or hotkey.ClassName=='TGenericHotkey')
         ) then return end

  local btn = createButton(ctrl.Owner)
  btn.Parent = ctrl.Parent
  btn.AnchorSideLeft.Control = ctrl
  btn.AnchorSideTop.Control = ctrl
  btn.Height = ctrl.Height
  btn.Width = 15
  btn.Caption = '…'
  if ctrl.ClassName=='tcheat' then
    btn.BorderSpacing.Left = ctrl.Descriptionleft - 20
  else -- not a tcheat component
    btn.BorderSpacing.Left = -20
  end
  hotkeys[1+#hotkeys] = {control=ctrl,hotkey=hotkey}
  btn.OnClick = function () changeHotkeyKeys(hotkey,ctrl) end
end

function hotkeysSettings(action)
  if     action:lower()=='save' then
    if hotkeysKeysSettings==nil then error'hotkeys settings path not defined' end
    for i,v in ipairs(hotkeys) do
      local name = createUniqueHotkeyName(v.hotkey,i)
      setHotkeyInRegistry(name,v.hotkey)
    end
  elseif action:lower()=='load' then
    if hotkeysKeysSettings==nil then error'hotkeys settings path not defined' end
    for i,v in ipairs(hotkeys) do
      local name = createUniqueHotkeyName(v.hotkey,i)
      getHotkeyFromRegistry(name,v.hotkey)
      updateControlWithHotkeyString(v.control,v.hotkey)
    end
  else
    hotkeysKeysSettings=getSettings(action)
  end

end