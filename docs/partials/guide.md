## Configuring Stylelint

In **[Megabyte Labs](https://megabyte.space)** projects, we include our Stylelint configuration in the form of a shareable NPM package. To accomodate this custom configuration method, we included the ability to specify the location of the configuration in the `.codeclimate.yml` file. Here is an example of customizing the location of the Stylelint configuration:

### Sample CodeClimate Configuration

```yaml
---
version: "2"
plugins:
  stylelint:
    enabled: true
    config: package.json
```
