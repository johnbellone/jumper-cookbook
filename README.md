# jumper-cookbook

Configure the host as a gateway (jump) machine for remote access.

## Supported Platforms

- [CentOS 6.5][3]
- [CentOS 5.10][4]
- [Ubuntu 12.04][5]
- [Ubuntu 14.04][6]

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
[3]: http://centos.org
[4]: http://centos.org
[5]: http://ubuntu.com
[6]: http://ubuntu.com
