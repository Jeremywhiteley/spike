# -*- coding: utf-8 -*-
module PeopleHelper
  # this makes me sad, but I couldn't get builder to escape/unescape
  # the URL properly, so we have to do it in an ad-hoc way here
  def search_url_template
    "#{people_url}/?utf8=✓&amp;search={searchTerms}".to_sym
  end
end
