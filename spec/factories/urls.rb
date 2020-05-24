# coding: utf-8
# frozen_string_literal: true
require 'ffaker'

FactoryBot.define do
  factory :url do
    original_url { FFaker::Internet.http_url }
  end
end
