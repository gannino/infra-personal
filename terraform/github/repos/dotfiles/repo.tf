resource "github_repository" "repo" {
  name        = "dotfiles"
  description = "My Dotfiles"

  default_branch = "master"
  private        = false

  has_wiki   = false
  has_issues = false

  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = true
}
