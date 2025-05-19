using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SataWebApi.Entity;

public partial class sataweb_dataContext : DbContext
{
    public sataweb_dataContext(DbContextOptions<sataweb_dataContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Agenda> Agendas { get; set; }

    public virtual DbSet<AgendaDay> AgendaDays { get; set; }

    public virtual DbSet<AgendaLink> AgendaLinks { get; set; }

    public virtual DbSet<AgendaTopic> AgendaTopics { get; set; }

    public virtual DbSet<Facilitator> Facilitators { get; set; }

    public virtual DbSet<PanelMember> PanelMembers { get; set; }

    public virtual DbSet<Speaker> Speakers { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Agenda>(entity =>
        {
            entity.Property(e => e.EndTime).HasMaxLength(50);
            entity.Property(e => e.StartTime).HasMaxLength(50);

            entity.HasOne(d => d.AgendaDay).WithMany(p => p.Agenda)
                .HasForeignKey(d => d.AgendaDayId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Agendas_AgendaDays");

            entity.HasOne(d => d.AgendaTopic).WithMany(p => p.Agenda)
                .HasForeignKey(d => d.AgendaTopicId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Agendas_AgendaTopics");
        });

        modelBuilder.Entity<AgendaDay>(entity =>
        {
            entity.HasKey(e => e.DayId);

            entity.Property(e => e.Date).HasColumnType("datetime");
            entity.Property(e => e.TextStyle).HasMaxLength(250);
        });

        modelBuilder.Entity<AgendaLink>(entity =>
        {
            entity.HasKey(e => e.AgendaLinkId).HasName("PK_AgendaLinkss");

            entity.HasOne(d => d.Agenda).WithMany(p => p.AgendaLinks)
                .HasForeignKey(d => d.AgendaId)
                .HasConstraintName("FK_AgendaLinks_Agendas");

            entity.HasOne(d => d.Facilitator).WithMany(p => p.AgendaLinks)
                .HasForeignKey(d => d.FacilitatorId)
                .HasConstraintName("FK_AgendaLinks_Facilitators");

            entity.HasOne(d => d.PanelMember).WithMany(p => p.AgendaLinks)
                .HasForeignKey(d => d.PanelMemberId)
                .HasConstraintName("FK_AgendaLinks_PanelMembers");

            entity.HasOne(d => d.Speaker).WithMany(p => p.AgendaLinks)
                .HasForeignKey(d => d.SpeakerId)
                .HasConstraintName("FK_AgendaLinks_Speakers");
        });

        modelBuilder.Entity<AgendaTopic>(entity =>
        {
            entity.Property(e => e.AgendaTopic1)
                .HasMaxLength(250)
                .HasColumnName("AgendaTopic");
        });

        modelBuilder.Entity<Facilitator>(entity =>
        {
            entity.Property(e => e.FacilitatorName).HasMaxLength(250);
        });

        modelBuilder.Entity<PanelMember>(entity =>
        {
            entity.Property(e => e.PanelMemberName).HasMaxLength(250);
        });

        modelBuilder.Entity<Speaker>(entity =>
        {
            entity.Property(e => e.SpeakerName).HasMaxLength(250);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
