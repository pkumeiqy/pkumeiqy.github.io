#import "tufted-lib/tufted.typ" as tufted


#let template = tufted.tufted-web.with(
  // 你可以在 header-links 中修改网站上方的导航栏都包含哪些页面
  // 例如，如果你想添加一个 Entry 页，你需要添加 `"/Entry/": "Entry"`
  // 然后在 `content/` 路径中新建 `Entry/`路径，在其中添加 `index.typ` 作为 Entry 页的内容
  header-links: (
    "/": "Home",
    "/Docs/": "Docs",
    "/Blog/": "Blog",
    "/CV/": "CV",
  ),
 /// 网站的站点标题。会显示在浏览器标签页以及 SEO/社交分享卡片中。
  website-title: "Mei QY's site!",
  /// 网站作者。用于生成 <meta name="author"> 标签。（可选）
  author: "@Mei QY",
  /// 网站描述。用于 SEO 搜索引擎摘要和社交媒体分享预览。（可选）
  description: "This is MQY's personal site. Glad you're here!",
  /// 站点的根 URL (例如 "https://example.com")。用于生成 Canonical URL 元数据。（可选）
  website-url: "pkumeiqy.github.io",
  /// 网站的默认语言，例如 "zh" 或 "en"，默认为 "zh"。
  lang: "zh",
  /// 订阅源配置 (字符串数组)，指定包含在 RSS 订阅源中的内容目录列表。（可选）
  /// 例如，`("/Blog/",)` 会将 `Blog` 目录下的所有文章包含在订阅源中。
  feed-dir: ("/Blog/",),
  
  /// 自定义页眉元素列表 (content 数组)。显示在页面顶部。
  header-elements: (
    [你好 !],
    [欢迎来到Mei QY的个人网页！],
  ),
  /// 自定义页脚元素列表 (content 数组)，显示在页面底部。
  footer-elements: (
    "© 2026 Mei QY  All rights reserved.",
    [Powered by #link("https://github.com/Yousa-Mirage/Tufted-Blog-Template")[Tufted-Blog-Template]],
  ),
  
)
