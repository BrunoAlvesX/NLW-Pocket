CREATE TABLE IF NOT EXISTS "goal_completions" (
	"id" text PRIMARY KEY NOT NULL,
	"goalId" text NOT NULL,
	"createdAt" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "goal_completions" ADD CONSTRAINT "goal_completions_goalId_goals_id_fk" FOREIGN KEY ("goalId") REFERENCES "public"."goals"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
