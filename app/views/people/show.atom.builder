atom_feed do |feed|
  feed.entry("c32", url: root_feed_path(@person)+"/c32", id: "/c32") do |entry|
    entry.link(rel: "alternate", type: Mime::Atom, href: root_feed_path(@person)+"/c32")
    entry.title("c32")
  end
end
