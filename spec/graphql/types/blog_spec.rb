# frozen_string_literal: true
require 'spec_helper'

module Spree::GraphQL
  describe 'Types::Blog' do
    let!(:blog) { create(:blog) }
    let!(:ctx) { { current_store: current_store } }
    let!(:variables) { }

    # articleByHandle: Find an article by its handle.
    # @param handle [Types::String!]
    # @return [Types::Article]
    describe 'articleByHandle' do
      let!(:query) {
        %q{
          query {
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
                blog {
                  articleByHandle(handle: "")
                  articles(
                    first: Int,
                    after: "",
                    last: Int,
                    before: "",
                    reverse: false
                  ) {
                    edges {
                      node
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
                        # ...
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
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
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
                blog: {
                  articleByHandle: 'Article...',
                  articles: {
                    edges: {
                      node: ['Article...'],
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
                comments: {
                  edges: {
                    node: [{
                      author: {
                        # ...
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

    # articles: List of the blog's articles.
    # @param reverse [Types::Boolean] (false)
    # @return [Types::Article.connection_type!]
    describe 'articles' do
      let!(:query) {
        %q{
          query {
            blog {
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
                    blog {
                      articleByHandle(handle: "")
                      articles(
                        first: Int,
                        after: "",
                        last: Int,
                        before: "",
                        reverse: false
                      ) {
                        # ...
                      }
                      authors {
                        # ...
                      }
                      handle
                      id
                      title
                      url
                    }
                    comments(
                      first: Int,
                      after: "",
                      last: Int,
                      before: "",
                      reverse: false
                    ) {
                      edges {
                        # ...
                      }
                      pageInfo {
                        # ...
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
            blog: {
              articles: {
                edges: {
                  node: [{
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
                    blog: {
                      articleByHandle: 'Article...',
                      articles: {
                        # ...
                      },
                      authors: {
                        # ...
                      },
                      handle: 'String',
                      id: 'ID',
                      title: 'String',
                      url: 'URL',
                    },
                    comments: {
                      edges: {
                        # ...
                      },
                      pageInfo: {
                        # ...
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

    # authors: The authors who have contributed to the blog.
    # @return [[Types::ArticleAuthor!]!]
    describe 'authors' do
      let!(:query) {
        %q{
          query {
            blog {
              authors {
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
            blog: {
              authors: [{
                bio: 'String',
                email: 'String',
                firstName: 'String',
                lastName: 'String',
                name: 'String',
              }],
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

    # handle: A human-friendly unique string for the Blog automatically generated from its title.
    # @return [Types::String!]
    describe 'handle' do
      let!(:query) {
        %q{
          query {
            blog {
              handle
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            blog: {
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
            blog {
              id
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            blog: {
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

    # title: The blogs’s title.
    # @return [Types::String!]
    describe 'title' do
      let!(:query) {
        %q{
          query {
            blog {
              title
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            blog: {
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

    # url: The url pointing to the blog accessible from the web.
    # @return [Types::URL!]
    describe 'url' do
      let!(:query) {
        %q{
          query {
            blog {
              url
            }
          }
        }
      }
      let!(:result) {
        {
          data: {
            blog: {
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