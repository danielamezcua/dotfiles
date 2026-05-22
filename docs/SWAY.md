# Sway Agent Notes

Guidance for making and verifying Sway window-management changes in this dotfiles repo.

## Window labels and selectors

When a task depends on a Sway window label, name, or id, do not guess from the process name, desktop file, or human-visible app name. Query Sway's tree and use the value Sway reports.

### Get the focused window label

Focus the target window, then run:

```bash
swaymsg -t get_tree | jq '.. | objects | select(.focused == true) | {
  id,
  name,
  app_id,
  window_properties,
  pid
}'
```

Use `app_id` for native Wayland windows. For XWayland windows, use `window_properties.class`/`instance`. Use `id`/`con_id` when you need to target one exact existing container.

### List all managed windows

```bash
swaymsg -t get_tree | jq -r '
  .. | objects
  | select(.type? == "con" and (.app_id? or .window_properties?))
  | "id=\(.id) app_id=\(.app_id // "") class=\(.window_properties.class // "") instance=\(.window_properties.instance // "") title=\(.name // "") pid=\(.pid // "")"
'
```

Example selectors:

```bash
swaymsg '[app_id="vscode"] move container to workspace number 3'
swaymsg '[class="SomeXWaylandClass"] move container to workspace number 3'
swaymsg '[con_id=80] move container to workspace number 3'
```

## Persistent workspace rules

When creating persistent workspace rules, verify by actually launching the app after reload. A valid selector can still fail as an `assign` rule during initial placement for some apps.

If `assign [app_id="..."] <workspace>` does not affect launch placement but the same selector works with `swaymsg '[app_id="..."] move container to workspace number ...'`, add a `for_window` move rule as a fallback:

```sway
assign [app_id="vscode"] 3
for_window [app_id="vscode"] move container to workspace number 3
```

## Safe verification workflow

Before making a change, capture the current state:

```bash
swaymsg -t get_workspaces > /tmp/sway-workspaces.before.json
swaymsg -t get_tree > /tmp/sway-tree.before.json
```

Run the command and require Sway to report success:

```bash
result=$(swaymsg '[app_id="vscode"] move container to workspace number 3')
printf '%s\n' "$result" | jq .
printf '%s\n' "$result" | jq -e 'all(.[]; .success == true)'
```

Afterward, verify the intended state with a targeted query instead of assuming the command worked:

```bash
swaymsg -t get_tree | jq -r '
  .nodes[].nodes[]
  | select(.type == "workspace") as $ws
  | ($ws | recurse(.nodes[]?, .floating_nodes[]?)
    | select(.app_id? == "vscode" or .window_properties.class? == "vscode")
    | "workspace=\($ws.name) id=\(.id) app_id=\(.app_id // "") title=\(.name // "")")
'
```

If editing the Sway config, validate syntax before reload/restart:

```bash
sway -C -c ~/.config/sway/config
```

On systems using proprietary Nvidia drivers, plain validation may exit nonzero before config parsing. Retry with:

```bash
sway --unsupported-gpu -C -c ~/.config/sway/config
```

Only reload after validation passes, and then confirm Sway is still responding:

```bash
swaymsg reload | jq -e 'all(.[]; .success == true)'
swaymsg -t get_version >/dev/null
swaymsg -t get_workspaces | jq .
```
