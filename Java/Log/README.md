# 关于日志文件的配置使用记录

## Log4j

## Logback
> 默认命名是 logback.xml


`easy.xml`
- 简单的按日志等级 ERROR DEBUG INFO 分别输出到文件.
- 简化异常信息，定位到异常抛出处所在行数


`rolling.xml`
- 在前面基础上增加了：
- 按日期自动切分日志文件，并有按日志等级 ERROR DEBUG INFO 分别输出

