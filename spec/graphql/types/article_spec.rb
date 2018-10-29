# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Article' do
    let!(:article) { create(:article) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # authorV2: The article's author.
    # @return [Types::ArticleAuthor]
    describe 'authorV2' do
      let!(:query) {
        %q{
          query {
            article {
              authorV2 {
                bio
                email
                firstName
                lastName
                name
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              authorV2: {
                bio: 'String',
                email: 'String',
                firstName: 'String',
                lastName: 'String',
                name: 'String',
              },
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # blog: The blog that the article belongs to.
    # @return [Types::Blog!]
    describe 'blog' do
      let!(:query) {
        %q{
          query {
            article {
              blog {
                articleByHandle(handle: "") {
                  author {
                    bio
                    email
                    firstName
                    lastName
                    name
                  }
                  authorV2 {
                    bio
                    email
                    firstName
                    lastName
                    name
                  }
                  blog
                  comments(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      node {
                        # ...
                      }
                    }
                    pageInfo {
                      hasNextPage
                      hasPreviousPage
                    }
                  }
                  content(truncateAt: Int)
                  contentHtml
                  excerpt(truncateAt: Int)
                  excerptHtml
                  handle
                  id
                  image(
                    maxWidth: Int,
                    maxHeight: Int,
                    crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                    scale: Int
                  ) {
                    altText
                    id
                    originalSrc
                    src
                    transformedSrc(
                      maxWidth: Int,
                      maxHeight: Int,
                      crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                      scale: Int,
                      preferredContentType: "PNG | JPG | WEBP"
                    )
                  }
                  publishedAt
                  tags
                  title
                  url
                }
                articles(
                  first: Int,
                  after: "",
                  last: Int,
                  before: "",
                  reverse: false
                ) {
                  edges {
                    node {
                      author {
                        # ...
                      }
                      authorV2 {
                        # ...
                      }
                      blog
                      comments(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      content(truncateAt: Int)
                      contentHtml
                      excerpt(truncateAt: Int)
                      excerptHtml
                      handle
                      id
                      image(
                        maxWidth: Int,
                        maxHeight: Int,
                        crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                        scale: Int
                      ) {
                        # ...
                      }
                      publishedAt
                      tags
                      title
                      url
                    }
                  }
                  pageInfo {
                    hasNextPage
                    hasPreviousPage
                  }
                }
                authors {
                  bio
                  email
                  firstName
                  lastName
                  name
                }
                handle
                id
                title
                url
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              blog: {
                articleByHandle: {
                  author: {
                    bio: 'String',
                    email: 'String',
                    firstName: 'String',
                    lastName: 'String',
                    name: 'String',
                  },
                  authorV2: {
                    bio: 'String',
                    email: 'String',
                    firstName: 'String',
                    lastName: 'String',
                    name: 'String',
                  },
                  blog: 'Blog...',
                  comments: {
                    edges: {
                      node: [{
                        # ...
                      }],
                    },
                    pageInfo: {
                      hasNextPage: true,
                      hasPreviousPage: false,
                    },
                  },
                  content: 'String',
                  contentHtml: 'HTML',
                  excerpt: 'String',
                  excerptHtml: 'HTML',
                  handle: 'String',
                  id: 'ID',
                  image: {
                    altText: 'String',
                    id: 'ID',
                    originalSrc: 'URL',
                    src: 'URL',
                    transformedSrc: 'URL',
                  },
                  publishedAt: 'DateTime',
                  tags: 'String',
                  title: 'String',
                  url: 'URL',
                },
                articles: {
                  edges: {
                    node: [{
                      author: {
                        # ...
                      },
                      authorV2: {
                        # ...
                      },
                      blog: 'Blog...',
                      comments: {
                        # ...
                      },
                      content: 'String',
                      contentHtml: 'HTML',
                      excerpt: 'String',
                      excerptHtml: 'HTML',
                      handle: 'String',
                      id: 'ID',
                      image: {
                        # ...
                      },
                      publishedAt: 'DateTime',
                      tags: 'String',
                      title: 'String',
                      url: 'URL',
                    }],
                  },
                  pageInfo: {
                    hasNextPage: true,
                    hasPreviousPage: false,
                  },
                },
                authors: {
                  bio: 'String',
                  email: 'String',
                  firstName: 'String',
                  lastName: 'String',
                  name: 'String',
                },
                handle: 'String',
                id: 'ID',
                title: 'String',
                url: 'URL',
              },
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # comments: List of comments posted on the article.
    # @param reverse [Types::Boolean] (false)
    # @return [Types::Comment.connection_type!]
    describe 'comments' do
      let!(:query) {
        %q{
          query {
            article {
              comments(
                first: Int,
                after: "",
                last: Int,
                before: "",
                reverse: false
              ) {
                edges {
                  node {
                    author {
                      email
                      name
                    }
                    content(truncateAt: Int)
                    contentHtml
                    id
                  }
                }
                pageInfo {
                  hasNextPage
                  hasPreviousPage
                }
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              comments: {
                edges: {
                  node: [{
                    author: {
                      email: 'String',
                      name: 'String',
                    },
                    content: 'String',
                    contentHtml: 'HTML',
                    id: 'ID',
                  }],
                },
                pageInfo: {
                  hasNextPage: true,
                  hasPreviousPage: false,
                },
              },
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # content: Stripped content of the article, single line with HTML tags removed.
    # @param truncate_at [Types::Int]
    # @return [Types::String!]
    describe 'content' do
      let!(:query) {
        %q{
          query {
            article {
              content(truncateAt: Int)
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              content: 'String',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # contentHtml: The content of the article, complete with HTML formatting.
    # @return [Types::HTML!]
    describe 'contentHtml' do
      let!(:query) {
        %q{
          query {
            article {
              contentHtml
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              contentHtml: 'HTML',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # excerpt: Stripped excerpt of the article, single line with HTML tags removed.
    # @param truncate_at [Types::Int]
    # @return [Types::String]
    describe 'excerpt' do
      let!(:query) {
        %q{
          query {
            article {
              excerpt(truncateAt: Int)
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              excerpt: 'String',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # excerptHtml: The excerpt of the article, complete with HTML formatting.
    # @return [Types::HTML]
    describe 'excerptHtml' do
      let!(:query) {
        %q{
          query {
            article {
              excerptHtml
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              excerptHtml: 'HTML',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # handle: A human-friendly unique string for the Article automatically generated from its title.
    # @return [Types::String!]
    describe 'handle' do
      let!(:query) {
        %q{
          query {
            article {
              handle
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              handle: 'String',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # id: Globally unique identifier.
    # @return [Types::ID!]
    describe 'id' do
      let!(:query) {
        %q{
          query {
            article {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              id: 'ID',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # image: The image associated with the article.
    # @param max_width [Types::Int]
    # @param max_height [Types::Int]
    # @param crop [Types::CropRegion]
    # @param scale [Types::Int] (1)
    # @return [Types::Image]
    describe 'image' do
      let!(:query) {
        %q{
          query {
            article {
              image(
                maxWidth: Int,
                maxHeight: Int,
                crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                scale: Int
              ) {
                altText
                id
                originalSrc
                src
                transformedSrc(
                  maxWidth: Int,
                  maxHeight: Int,
                  crop: "CENTER | TOP | BOTTOM | LEFT | RIGHT",
                  scale: Int,
                  preferredContentType: "PNG | JPG | WEBP"
                )
              }
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              image: {
                altText: 'String',
                id: 'ID',
                originalSrc: 'URL',
                src: 'URL',
                transformedSrc: 'URL',
              },
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # publishedAt: The date and time when the article was published.
    # @return [Types::DateTime!]
    describe 'publishedAt' do
      let!(:query) {
        %q{
          query {
            article {
              publishedAt
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              publishedAt: 'DateTime',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # tags: A categorization that a article can be tagged with.
    # @return [[Types::String!]!]
    describe 'tags' do
      let!(:query) {
        %q{
          query {
            article {
              tags
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              tags: ['String'],
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # title: The article’s name.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            article {
              title
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              title: 'String',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end

    # url: The url pointing to the article accessible from the web.
    # @return [Types::URL!]
    describe 'url' do
      let!(:query) {
        %q{
          query {
            article {
              url
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            article: {
              url: 'URL',
            }
          },
          #errors: {},
        }
      }
      #it 'succeeds' do
      #  execute
      #  expect(response_hash).to eq(result_hash)
      #end
    end
  end
end