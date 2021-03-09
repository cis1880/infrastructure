locals {
  // Name of the homework mapped to published status
  published = {
    hw0           = true
    hw1           = true
    hw2           = true
    hw3           = false
    hw4           = false
    final_project = false
  }
  // Create a list of objects representing all homework repos to be (eventually) created. 
  hws = flatten([
    for hw, published in local.published : [
      for student in var.students : {
        hw = hw, student = student, published = published
      }
    ]
  ])
  bot_user         = "cis188bot"
  k8s_cluster_name = "cis188"
  instructors = toset([
    "armaan",
    "peyton",
  ])
}
