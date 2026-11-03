create table if not exists public.learning_sessions (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 topic text not null,
 category text not null,
 difficulty text not null check (difficulty in ('Básico','Intermédio','Avançado')),
 notes text not null default '',
 ratings jsonb not null default '{}'::jsonb,
 research_seconds integer not null default 0 check (research_seconds between 0 and 1800),
 presentation_seconds integer not null default 0 check (presentation_seconds between 0 and 60),
 completed_at timestamptz not null default now()
);
create index if not exists learning_sessions_user_date on public.learning_sessions(user_id,completed_at desc);
alter table public.learning_sessions enable row level security;
create policy "Users read own sessions" on public.learning_sessions for select to authenticated using ((select auth.uid())=user_id);
create policy "Users insert own sessions" on public.learning_sessions for insert to authenticated with check ((select auth.uid())=user_id);
create policy "Users update own sessions" on public.learning_sessions for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
create policy "Users delete own sessions" on public.learning_sessions for delete to authenticated using ((select auth.uid())=user_id);
grant select,insert,update,delete on public.learning_sessions to authenticated;
