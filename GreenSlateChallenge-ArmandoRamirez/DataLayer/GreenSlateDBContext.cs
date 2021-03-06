﻿using System;
using GSC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace GSC.DataAcces
{
    public partial class GreenSlateDBContext : DbContext
    {
        public GreenSlateDBContext()
        {
        }

        public GreenSlateDBContext(DbContextOptions<GreenSlateDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Project> Project { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserProject> UserProject { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Data Source=(local);Initial Catalog=GreenSlateDB;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Project>(entity =>
            {
                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.StartDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<UserProject>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.ProjectId });

                entity.Property(e => e.AssignedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Project)
                    .WithMany(p => p.UserProject)
                    .HasForeignKey(d => d.ProjectId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserProject_Project");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserProject)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserProject_User");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
