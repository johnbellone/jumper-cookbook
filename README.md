# jumper-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['jumper']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### jumper::default

Include `jumper` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[jumper::default]"
  ]
}
```

## License and Authors

Author:: [John Bellone][1] [@johnbellone][2] (<jbellone@bloomberg.net>)

[1]: https://github.com/johnbellone
[2]: https://twitter.com/johnbellone
